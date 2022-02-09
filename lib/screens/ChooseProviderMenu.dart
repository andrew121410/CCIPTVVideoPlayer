import 'package:cc_iptv_video_player/managers/ProviderDetailsStorageManager.dart';
import 'package:cc_iptv_video_player/screens/ProvidersEditMenu.dart';
import 'package:cc_iptv_video_player/utils/ProvidersMenuUtils.dart';
import 'package:flutter/material.dart';

class ChooseProviderMenu extends StatefulWidget {
  @override
  ChooseProviderMenuPage createState() => ChooseProviderMenuPage();
}

class ChooseProviderMenuPage extends State<ChooseProviderMenu> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: loadUpDataAsync(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Text("Loading Please Wait...");
          default:
            if (snapshot.hasError)
              return Text('Error: ${snapshot.error}');
            else {
              return Scaffold(
                backgroundColor: Colors.white70,
                appBar: AppBar(
                  title: Text("Providers"),
                  automaticallyImplyLeading: false,
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () => {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProvidersEditMenu()))
                        .then((value) {
                      setState(() {});
                    })
                  },
                  child: Icon(Icons.settings),
                ),
                body: SingleChildScrollView(
                  child: Column(children: [
                    ProvidersMenuUtils.createProvidersWidget(
                        context, false, true, () {
                      setState(() {});
                    }),
                  ]),
                ),
              );
            }
        }
      },
    );
  }

  Future<String> loadUpDataAsync() async {
    //This will load up all the providers from storage
    if (!ProviderDetailsStorageManager.dataLoaded) {
      await ProviderDetailsStorageManager.loadAll();
      print("Loading up data in (LoadUpData) -> ChooseProviderMenu.dart");
    }
    return Future.value("Data has loaded!");
  }

  @override
  void initState() {
    super.initState();
  }
}
