import 'package:flutter/material.dart';

class PickCategoryMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pick A Category!")),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 40,
              width: 200,
              child: ElevatedButton(
                onPressed: null,
                child: Text("Hi"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}