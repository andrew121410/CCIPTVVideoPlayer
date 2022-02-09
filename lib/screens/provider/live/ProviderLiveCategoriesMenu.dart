import 'package:cc_iptv_video_player/drawer/NavigationDrawerMenu.dart';
import 'package:cc_iptv_video_player/objects/ProviderDetails.dart';
import 'package:cc_iptv_video_player/utils/XStreamUtils.dart';
import 'package:cc_iptv_video_player/xstreamobjects/XChannel.dart';
import 'package:flutter/material.dart';

import '../../../objects/Provider.dart';
import '../../../xstreamobjects/XCategory.dart';

class ProviderLiveCategoriesMenu extends StatefulWidget {
  ProviderDetails providerDetails;
  List<XCategory> liveXCategories = [];

  ProviderLiveCategoriesMenu({required this.providerDetails});

  @override
  ProviderLiveCategoriesMenuPage createState() =>
      ProviderLiveCategoriesMenuPage(
          providerDetails: this.providerDetails,
          liveXCategories: this.liveXCategories);

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
  List<XChannel>? liveXChannels;
  XCategory? xCategorySelected;

  ProviderLiveCategoriesMenuPage(
      {required this.providerDetails, required this.liveXCategories});

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
          listView: this.providerDetails.getProvider().createDrawerListView(context, liveXCategories, (x) async {
            //Ran when clicking a category
            List<XChannel> xChannels = await XStreamUtils.getLiveCategoryChannels(providerDetails.getProvider(), x.categoryId);
            setState(() {
              this.xCategorySelected = x;
              this.liveXChannels = xChannels;
            });
          })),
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text("Live Channels!"),
      ),
      body: this.liveXChannels == null
          ? Text("Please select a category!")
          : SingleChildScrollView(
            child: Column(
              children: [
                Text(this.xCategorySelected!.categoryName, style: TextStyle(
                  fontSize: 30,
                ),),
                this.providerDetails.getProvider().createChannelsListView(context, this.liveXChannels!),
      ],
            ),
          ),
    );
  }
}
