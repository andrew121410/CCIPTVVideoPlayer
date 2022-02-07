import 'package:cc_iptv_video_player/managers/ProviderDetailsManager.dart';
import 'package:cc_iptv_video_player/objects/ProviderDetails.dart';
import 'package:cc_iptv_video_player/screens/AddProviderMenu.dart';
import 'package:flutter/material.dart';

class ProvidersEditMenu extends StatefulWidget {
  @override
  ProvidersEditMenuPage createState() => ProvidersEditMenuPage();
}

class ProvidersEditMenuPage extends State<ProvidersEditMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text("Provider Manager"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          ProviderDetails? providerDetails = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddProviderMenu([])));
          if (providerDetails != null) {
            setState(() {
              ProviderDetailsManager.addProvider(providerDetails);
              ProviderDetailsManager.saveAll();
            }); //Update
          }
        },
      ),
      body: Container(
          child: ProviderDetailsManager.providers.isEmpty
              ? Center(
                  child: Text("You don't have any providers."),
                )
              : SingleChildScrollView(
                  child: Column(children: [
                    ProvidersMenuUtils().createProviderWidget(
                        context, true, false, () => {setState(() {})}),
                  ]),
                )),
    );
  }
}

class ProvidersMenuUtils {
  Widget _theSizedBox(ProviderDetails providerDetails) {
    return SizedBox(
      height: 40,
      width: 200,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(providerDetails.prefix),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        ),
      ),
    );
  }

  ListView createProviderWidget(
      BuildContext context, bool editMode, bool center, Function setTheState) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: ProviderDetailsManager.providers.keys.length,
        itemBuilder: (BuildContext context, int index) {
          ProviderDetails providerDetails =
              ProviderDetailsManager.providers.values.elementAt(index);

          return Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                center
                    ? Expanded(
                        child: Center(
                        child: _theSizedBox(providerDetails),
                      ))
                    : _theSizedBox(providerDetails),

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
                                        createEditTextControllers(
                                            providerDetails))));
                        if (providerDetailsPush != null) {
                          ProviderDetailsManager.removeProvider(
                              providerDetailsPush.prefix);
                          ProviderDetailsManager.addProvider(
                              providerDetailsPush);
                          ProviderDetailsManager.saveAll();
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
                        ProviderDetailsManager.removeProvider(
                            providerDetails.prefix);
                        ProviderDetailsManager.saveAll();
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

  List<TextEditingController> createEditTextControllers(
      ProviderDetails providerDetails) {
    List<TextEditingController> list = [];
    list.add(TextEditingController(text: providerDetails.prefix));
    list.add(TextEditingController(text: providerDetails.url));
    list.add(TextEditingController(text: providerDetails.username));
    list.add(TextEditingController(text: providerDetails.password));
    return list;
  }
}
