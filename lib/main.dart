import 'package:flutter/material.dart';

import 'managers/ProviderDetailsManager.dart';
import 'screens/ChooseProviderMenu.dart';

void main() {
  runApp(MyTestingApplicationMenu());
}

class MyTestingApplicationMenu extends StatefulWidget {
  @override
  MyTestingApplicationMenuPage createState() => MyTestingApplicationMenuPage();
}

class MyTestingApplicationMenuPage extends State<MyTestingApplicationMenu> {
  static MyTestingApplicationMenuPage? instance;

  ProviderDetailsManager providerDetailsManager = ProviderDetailsManager();

  MyTestingApplicationMenuPage() {
    instance = this;
  }

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 30), () async {
      print("Loading up all the providers (initState)");
      providerDetailsManager.loadAll();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChooseProviderMenu(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
