import 'package:cc_iptv_video_player/drawer/NavigationDrawerMenu.dart';
import 'package:cc_iptv_video_player/objects/ProviderDetails.dart';
import 'package:cc_iptv_video_player/utils/XStreamUtils.dart';
import 'package:flutter/material.dart';

import '../../../objects/Provider.dart';
import '../../../xstreamobjects/XCategory.dart';

class ProviderLiveCategoriesMenu extends StatefulWidget {
  late ProviderDetails _providerDetails;

  ProviderLiveCategoriesMenu(ProviderDetails providerDetails){
    this._providerDetails = providerDetails;
  }

  @override
  ProviderLiveCategoriesMenuPage createState() => ProviderLiveCategoriesMenuPage(_providerDetails);
}

class ProviderLiveCategoriesMenuPage extends State<ProviderLiveCategoriesMenu> {
  late ProviderDetails _providerDetails;
  List<XCategory> liveXCategories = [];

  ProviderLiveCategoriesMenuPage(ProviderDetails providerDetails) {
    this._providerDetails = providerDetails;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: loadUpProvider(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Text("Loading Please Wait...");
          default:
            if (snapshot.hasError)
              return Text('Error: ${snapshot.error}');
            else {
              return Scaffold(
                drawer: NavigationDrawerMenu(nameOfPage: "Live Categories!", listView: _providerDetails.getProvider().createDrawerListView(context, liveXCategories)),
                backgroundColor: Colors.white70,
                appBar: AppBar(
                  title: Text("Live Categories!"),
                ),
                body: SingleChildScrollView(
                  child: Column(
                      children: [
                        // _providerDetails.getProvider().createWidgetsCategories(context, liveXCategories),
                      ]
                  ),
                ),
              );
            }
        }
      },
    );
  }

  Future<String> loadUpProvider() async {
    Provider provider = _providerDetails.getProvider();
    List<XCategory> liveXCategories = await XStreamUtils.getLiveCategories(provider);
    this.liveXCategories = liveXCategories;
    return Future.value("liveXCategories Loaded! (loadUpProvider) ProviderLiveCategoriesMenu/Page");
  }
}
