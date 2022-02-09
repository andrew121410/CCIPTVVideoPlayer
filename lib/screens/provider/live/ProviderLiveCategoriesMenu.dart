import 'package:cc_iptv_video_player/drawer/NavigationDrawerMenu.dart';
import 'package:cc_iptv_video_player/objects/ProviderDetails.dart';
import 'package:cc_iptv_video_player/utils/XStreamUtils.dart';
import 'package:flutter/material.dart';

import '../../../objects/Provider.dart';
import '../../../xstreamobjects/XCategory.dart';

class ProviderLiveCategoriesMenu extends StatefulWidget {
  ProviderDetails providerDetails;
  List<XCategory> liveXCategories = [];

  ProviderLiveCategoriesMenu({required this.providerDetails});

  @override
  ProviderLiveCategoriesMenuPage createState() =>
      ProviderLiveCategoriesMenuPage(providerDetails: this.providerDetails, liveXCategories: this.liveXCategories);

  Future<String> loadUpLiveXCategories() async {
    Provider provider = this.providerDetails.getProvider();
    List<XCategory> liveXCategories =
    await XStreamUtils.getLiveCategories(provider);
    this.liveXCategories = liveXCategories;
    return Future.value(
        "liveXCategories Loaded! (loadUpProvider) ProviderLiveCategoriesMenu/Page");
  }
}

class ProviderLiveCategoriesMenuPage extends State<ProviderLiveCategoriesMenu> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  ProviderDetails providerDetails;
  List<XCategory> liveXCategories;

  ProviderLiveCategoriesMenuPage({required this.providerDetails, required this.liveXCategories});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      this._scaffoldKey.currentState?.openDrawer();
    });

    return Scaffold(
      key: this._scaffoldKey,
      drawer: NavigationDrawerMenu(
          nameOfPage: "Live Categories!",
          listView: this.providerDetails.getProvider().createDrawerListView(context, liveXCategories)),
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text("Live Categories!"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          // _providerDetails.getProvider().createWidgetsCategories(context, liveXCategories),
        ]),
      ),
    );
  }
}
