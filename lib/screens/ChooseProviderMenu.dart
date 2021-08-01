import 'package:flutter/material.dart';
import 'package:testingproject/main.dart';
import 'package:testingproject/screens/ProvidersEditMenu.dart';

class ChooseProviderMenu extends StatefulWidget {
  @override
  ChooseProviderMenuPage createState() => ChooseProviderMenuPage();
}

class ChooseProviderMenuPage extends State<ChooseProviderMenu> {
  ProvidersMenuUtils _providersMenuUtils = ProvidersMenuUtils();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Providers"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
           Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProvidersEditMenu())),
          setState(() {}),
        },
        child: Icon(Icons.settings),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: this._providersMenuUtils.createProvidersWidgets(context, false, () {
            setState(() {

            });
          }),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
