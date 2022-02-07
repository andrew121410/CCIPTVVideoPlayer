import 'dart:core';

import 'package:flutter/material.dart';
import 'package:m3u/m3u.dart';
import 'package:cc_iptv_video_player/managers/ProvidersManager.dart';
import 'package:cc_iptv_video_player/objects/ProviderDetails.dart';

class Provider {
  ProviderDetails _providerDetails;
  List<M3uGenericEntry>? _categoriesCom;

  Provider(this._providerDetails);

  void tryToResolveM3U() async {
    this._categoriesCom = await ProvidersManager.getM3UFromURL(_providerDetails);
  }

  List<Widget> createWidgets(BuildContext context) {
    List<Widget> wid = [];

    if (this._categoriesCom == null) {
      return wid;
    }

    this._categoriesCom!.forEach((element) {
      wid.add(Row(
        children: [
          SizedBox(
            height: 40,
            width: 200,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(element.title),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
            ),
          ),
        ],
      ));
    });
    return wid;
  }
}
