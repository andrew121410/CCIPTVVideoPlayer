import 'dart:core';

import 'package:cc_iptv_video_player/drawer/DrawerItem.dart';
import 'package:cc_iptv_video_player/objects/ProviderDetails.dart';
import 'package:flutter/material.dart';

import '../xstreamobjects/XCategory.dart';
import '../xstreamobjects/XChannel.dart';

class Provider {
  ProviderDetails _providerDetails;

  Provider(this._providerDetails);

  //Used in/for NavigationDrawerMenu
  ListView createDrawerListView(BuildContext context,
      List<XCategory> xCategories, Function(XCategory) onPressed) {
    return ListView.builder(
        controller: ScrollController(),
        shrinkWrap: true,
        itemCount: xCategories.length,
        itemBuilder: (BuildContext context, int index) {
          XCategory element = xCategories[index];
          return DrawerItem(
              name: element.categoryName,
              onPressed: () {
                onPressed(element);
              });
        });
  }

  GridView createChannelsListView(
      BuildContext context, List<XChannel> xChannels) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
          childAspectRatio: 7, mainAxisSpacing: 8, crossAxisSpacing: 8,
      ),
        shrinkWrap: true,
        itemCount: xChannels.length,
        itemBuilder: (BuildContext context, int index) {
          XChannel xChannel = xChannels[index];

          return ElevatedButton(
            onPressed: () {},
            child: Text(xChannel.name),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo),
            ),
          );
        });
  }

  ProviderDetails get getProviderDetails {
    return _providerDetails;
  }
}
