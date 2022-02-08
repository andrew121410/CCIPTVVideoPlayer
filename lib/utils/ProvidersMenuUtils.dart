import 'package:cc_iptv_video_player/utils/ProvidersUtils.dart';
import 'package:flutter/material.dart';

import '../managers/ProviderDetailsStorageManager.dart';
import '../objects/ProviderDetails.dart';
import '../screens/AddProviderMenu.dart';
import '../screens/provider/live/ProviderLiveCategoriesMenu.dart';

class ProvidersMenuUtils {
  static Widget _theSizedBox(
      BuildContext context, ProviderDetails providerDetails) {
    return SizedBox(
      height: 40,
      width: 200,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ProviderLiveCategoriesMenu(providerDetails)));
        },
        child: Text(providerDetails.prefix),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        ),
      ),
    );
  }

  static ListView createProvidersWidget(
      BuildContext context, bool editMode, bool center, Function setTheState) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: ProvidersUtils.providersDetailsMap.keys.length,
        itemBuilder: (BuildContext context, int index) {
          ProviderDetails providerDetails =
              ProvidersUtils.providersDetailsMap.values.elementAt(index);

          return Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                center
                    ? Expanded(
                        child: Center(
                        child: _theSizedBox(context, providerDetails),
                      ))
                    : _theSizedBox(context, providerDetails),

                if (editMode) SizedBox(width: 20),
                //Edit button
                if (editMode)
                  IconButton(
                      onPressed: () async {
                        ProviderDetails? providerDetailsPush =
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddProviderMenu(
                                        _createEditTextControllers(
                                            providerDetails))));
                        if (providerDetailsPush != null) {
                          ProvidersUtils.removeProvider(
                              providerDetailsPush.prefix);
                          ProvidersUtils.addProviderDetails(
                              providerDetailsPush);
                          ProviderDetailsStorageManager.saveAll();
                          setTheState();
                        }
                      },
                      icon: Icon(Icons.edit),
                      color: Colors.black),
                if (editMode) SizedBox(width: 20), // give it width
                //Delete button
                if (editMode)
                  IconButton(
                      onPressed: () async {
                        ProvidersUtils.removeProvider(providerDetails.prefix);
                        ProviderDetailsStorageManager.saveAll();
                        setTheState();
                      },
                      icon: Icon(Icons.delete),
                      color: Colors.red),
              ],
            ),
          );
          // widgets.add(Padding(padding: EdgeInsets.only(bottom: 10)));
        });
  }

  static List<TextEditingController> _createEditTextControllers(
      ProviderDetails providerDetails) {
    List<TextEditingController> list = [];
    list.add(TextEditingController(text: providerDetails.prefix));
    list.add(TextEditingController(text: providerDetails.url));
    list.add(TextEditingController(text: providerDetails.username));
    list.add(TextEditingController(text: providerDetails.password));
    return list;
  }
}
