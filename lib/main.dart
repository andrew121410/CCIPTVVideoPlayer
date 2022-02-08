import 'package:flutter/material.dart';

import 'managers/ProviderDetailsStorageManager.dart';
import 'screens/ChooseProviderMenu.dart';

void main() {
  runApp(CCIPTVVideoPlayerMenu());
}

class CCIPTVVideoPlayerMenu extends StatefulWidget {

  @override
  CCIPTVVideoPlayerMenuPage createState() {
    return CCIPTVVideoPlayerMenuPage();
  }
}

class CCIPTVVideoPlayerMenuPage extends State<CCIPTVVideoPlayerMenu> {
  static CCIPTVVideoPlayerMenuPage? instance;
  static ProviderDetailsStorageManager providerDetailsManager = ProviderDetailsStorageManager();

  CCIPTVVideoPlayerMenuPage() {
    instance = this;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChooseProviderMenu(),
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
    );
  }
}
