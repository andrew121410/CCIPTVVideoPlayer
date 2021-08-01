import 'package:flutter/material.dart';
import 'package:testingproject/main.dart';
import 'package:testingproject/managers/ProviderDetailsManager.dart';
import 'package:testingproject/objects/ProviderDetails.dart';
import 'package:testingproject/screens/AddProviderMenu.dart';

class ProvidersEditMenu extends StatefulWidget {
  @override
  ProvidersEditMenuPage createState() => ProvidersEditMenuPage();
}

class ProvidersEditMenuPage extends State<ProvidersEditMenu> {
  ProviderDetailsManager _providersManager = MyTestingApplicationMenuPage.instance!.providerDetailsManager;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Manager"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          ProviderDetails? providerDetails = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddProviderMenu([])));
          if (providerDetails != null) {
            setState(() {
              _providersManager.addProvider(providerDetails);
            }); //Update
            _providersManager.saveAll();
          }
        },
      ),
      body: Container(
          child: _providersManager.providers.isEmpty
              ? Center(
                  child: Text("You don't have any providers."),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: ProvidersMenuUtils().createProvidersWidgets(
                        context, true, () => {setState(() {})}),
                  ),
                )),
    );
  }
}

class ProvidersMenuUtils {
  ProviderDetailsManager _providersManager = MyTestingApplicationMenuPage.instance!.providerDetailsManager;

  List<Widget> createProvidersWidgets(
      BuildContext context, bool editMode, Function setTheState) {
    List<Widget> widgets = [];

    if (_providersManager.providers.isNotEmpty) {
      for (var value in this._providersManager.providers.values) {
        widgets.add(Row(
          children: [
            SizedBox(
              height: 40,
              width: 200,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(value.prefix),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
              ),
            ),
            if (editMode) SizedBox(width: 20),
            //Edit button
            if (editMode)
              IconButton(
                  onPressed: () async {
                    ProviderDetails? providerDetails = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddProviderMenu(
                                createEditTextControllers(value))));
                    if (providerDetails != null) {
                      _providersManager.removeProvider(value.prefix);
                      _providersManager.addProvider(providerDetails);
                      setTheState();
                      _providersManager.saveAll();
                    }
                  },
                  icon: Icon(Icons.edit),
                  color: Colors.black),
            if (editMode) SizedBox(width: 20), // give it width
            //Delete button
            if (editMode)
              IconButton(
                  onPressed: () {
                    _providersManager.removeProvider(value.prefix);
                    setTheState();
                    _providersManager.saveAll();
                  },
                  icon: Icon(Icons.delete),
                  color: Colors.red),
          ],
        ));
        widgets.add(Padding(padding: EdgeInsets.only(bottom: 10)));
      }
    }
    return widgets;
  }

  List<TextEditingController> createEditTextControllers(
      ProviderDetails providerDetails) {
    List<TextEditingController> list = [];
    list.add(TextEditingController(text: providerDetails.prefix));
    list.add(TextEditingController(text: providerDetails.url));
    list.add(TextEditingController(text: providerDetails.username));
    list.add(TextEditingController(text: providerDetails.password));
    return list;
  }
}
