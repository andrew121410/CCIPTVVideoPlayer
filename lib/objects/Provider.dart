import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m3u/m3u.dart';
import 'package:testingproject/managers/ProvidersManager.dart';
import 'package:testingproject/objects/ProviderDetails.dart';

class Provider {
  ProviderDetails providerDetails;
  List<M3uGenericEntry>? categoriesCom;

  Provider(this.providerDetails);

  void tryToResolveM3U() async {
    this.categoriesCom = await ProvidersManager.getM3UFromURL(providerDetails);
  }

  List<Widget> createWidgets(BuildContext context) {
    List<Widget> wid = [];

    if (this.categoriesCom == null) {
      return wid;
    }

    this.categoriesCom!.forEach((element) {
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
