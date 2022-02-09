import 'package:cc_iptv_video_player/buttons/GradientButton.dart';
import 'package:cc_iptv_video_player/objects/ProviderDetails.dart';
import 'package:flutter/material.dart';

import 'live/ProviderLiveCategoriesMenu.dart';

class PickCategoryMenu extends StatelessWidget {

  ProviderDetails providerDetails;

  PickCategoryMenu({required this.providerDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.black45, Colors.purple])),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Pick A Category!"),
          backgroundColor: Colors.white24),
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 100)),
            Text(providerDetails.prefix, style: TextStyle(
              color: Colors.yellowAccent,
              fontWeight: FontWeight.bold,
              fontSize: 25
            ),),
            Padding(padding: EdgeInsets.only(top: 200)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 75,
                  width: 200,
                  child: GradientButton(
                    gradient: LinearGradient(colors: [Colors.cyan, Colors.indigo]),
                    child: Text("Live"),
                    onPressed: () async {
                      ProviderLiveCategoriesMenu providerLiveCatMenu = ProviderLiveCategoriesMenu(providerDetails: providerDetails);
                      await providerLiveCatMenu.loadUpLiveXCategories();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => providerLiveCatMenu));
                    },
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 200),),
                SizedBox(
                  height: 75,
                  width: 200,
                  child: GradientButton(
                    onPressed: () {},
                    gradient: LinearGradient(colors: [Colors.orange, Colors.white30]),
                    child: Text("Movies"),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 200),),
                SizedBox(
                  height: 75,
                  width: 200,
                  child: GradientButton(
                    onPressed: () {},
                    gradient: LinearGradient(colors: [Colors.cyan, Colors.deepPurple]),
                    child: Text("Series"),
                  ),
                ),
              ],
            ),
    ],
        ),
      ),
    );
  }

}