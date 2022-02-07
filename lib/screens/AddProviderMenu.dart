import 'package:flutter/material.dart';
import 'package:cc_iptv_video_player/objects/ProviderDetails.dart';

class AddProviderMenu extends StatefulWidget {
  List<TextEditingController> _textEditingControllers;

  AddProviderMenu(this._textEditingControllers);

  @override
  AddProviderMenuPage createState() =>
      AddProviderMenuPage(_textEditingControllers);
}

class AddProviderMenuPage extends State<AddProviderMenu> {
  List<TextEditingController> _textEditingControllers;

  late String prefix;
  late String url;
  late String username;
  late String password;

  AddProviderMenuPage(this._textEditingControllers){
    this.prefix = _textEditingControllers.isNotEmpty ? _textEditingControllers[0].value.text : "";
    this.url = _textEditingControllers.isNotEmpty ? _textEditingControllers[1].value.text : "";
    this.username = _textEditingControllers.isNotEmpty ? _textEditingControllers[2].value.text : "";
    this.password = _textEditingControllers.isNotEmpty ? _textEditingControllers[3].value.text : "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Provider"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(hintText: "Prefix"),
                onChanged: (thePrefix) => this.prefix = thePrefix,
                controller: _textEditingControllers.isNotEmpty
                    ? _textEditingControllers[0]
                    : null,
              ),
              TextField(
                decoration: InputDecoration(hintText: "URL"),
                onChanged: (theUrl) => this.url = theUrl,
                controller: _textEditingControllers.isNotEmpty
                    ? _textEditingControllers[1]
                    : null,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Username"),
                onChanged: (theUsername) => this.username = theUsername,
                controller: _textEditingControllers.isNotEmpty
                    ? _textEditingControllers[2]
                    : null,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Password"),
                onChanged: (thePassword) => this.password = thePassword,
                controller: _textEditingControllers.isNotEmpty
                    ? _textEditingControllers[3]
                    : null,
              ),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    var providerDetails = ProviderDetails(
                        this.prefix, this.url, this.username, this.password);
                    print("BEFORE POOPING THAT BICH " + this.prefix);
                    Navigator.pop(context, providerDetails);
                  },
                  child: Text("Submit"),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
