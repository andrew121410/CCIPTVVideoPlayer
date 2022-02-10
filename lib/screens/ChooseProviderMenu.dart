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
              return Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.lightGreen, Colors.black45]),
                ),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    backgroundColor: Colors.black45,
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
                    child: Column(
                        children: [
                          Padding(padding: EdgeInsets.only(bottom: 50)),
                          Text("CCIPTVVideoPlayer",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),),
                      Padding(padding: EdgeInsets.only(bottom: 50)),
                      ProvidersMenuUtils.createProvidersWidget(
                          context, false, () {
                        setState(() {});
                      }),
                    ]),
                  ),
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
