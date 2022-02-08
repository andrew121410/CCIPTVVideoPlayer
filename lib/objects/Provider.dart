import 'dart:core';

import 'package:cc_iptv_video_player/objects/ProviderDetails.dart';
import 'package:cc_iptv_video_player/xstreamdata/XCategory.dart';
import 'package:flutter/material.dart';

class Provider {
  ProviderDetails _providerDetails;

  Provider(this._providerDetails);

  ListView createWidgetsCategories(
      BuildContext context, List<XCategory> xCategories) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: xCategories.length,
        itemBuilder: (BuildContext context, int index) {
          XCategory element = xCategories[index];
          return Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(element.categoryName),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  ProviderDetails get getProviderDetails {
    return _providerDetails;
  }
}
