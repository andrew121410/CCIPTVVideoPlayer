import 'package:cc_iptv_video_player/objects/ProviderDetails.dart';
import 'package:cc_iptv_video_player/screens/provider/live/ProviderLiveCategoriesMenu.dart';
import 'package:flutter/material.dart';

import '../../objects/Provider.dart';
import '../../xstreamobjects/XCategory.dart';

class PickCategoryMenu extends StatelessWidget {

  ProviderDetails providerDetails;

  PickCategoryMenu({required this.providerDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pick A Category!")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
              width: 200,
              child: ElevatedButton(
                onPressed: () async {
                  ProviderLiveCategoriesMenu providerLiveCatMenu = ProviderLiveCategoriesMenu(providerDetails: providerDetails);
                  await providerLiveCatMenu.loadUpLiveXCategories();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => providerLiveCatMenu));
                },
                child: Text("Live"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.teal),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 10),),
            SizedBox(
              height: 40,
              width: 200,
              child: ElevatedButton(
                onPressed: null,
                child: Text("Movies"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.teal),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 10),),
            SizedBox(
              height: 40,
              width: 200,
              child: ElevatedButton(
                onPressed: null,
                child: Text("Series"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.teal),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}