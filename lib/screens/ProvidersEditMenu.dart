import 'package:cc_iptv_video_player/managers/ProviderDetailsStorageManager.dart';
import 'package:cc_iptv_video_player/objects/ProviderDetails.dart';
import 'package:cc_iptv_video_player/screens/AddProviderMenu.dart';
import 'package:cc_iptv_video_player/utils/ProvidersMenuUtils.dart';
import 'package:cc_iptv_video_player/utils/ProvidersUtils.dart';
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
        title: Text("Provider's Manager"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          ProviderDetails? providerDetails = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddProviderMenu([])));
          if (providerDetails != null) {
            setState(() {
              ProvidersUtils.addProviderDetails(providerDetails);
              ProviderDetailsStorageManager.saveAll();
            }); //Update
          }
        },
      ),
      body: Container(
          child: ProvidersUtils.providersDetailsMap.isEmpty
              ? Center(
                  child: Text("You don't have any providers."),
                )
              : SingleChildScrollView(
                  child: Column(children: [
                    ProvidersMenuUtils.createProvidersWidget(
                        context, true, false, () => {setState(() {})}),
                  ]),
                )),
    );
  }
}
