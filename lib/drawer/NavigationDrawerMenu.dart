import 'package:flutter/material.dart';

class NavigationDrawerMenu extends StatefulWidget {
  String nameOfPage;
  ListView listView;

  NavigationDrawerMenu({Key? key, required this.nameOfPage, required this.listView}) : super(key: key);

  @override
  NavigationDrawerMenuPage createState() => NavigationDrawerMenuPage(nameOfPage: this.nameOfPage, listView: this.listView);
}

class NavigationDrawerMenuPage extends State<NavigationDrawerMenu> {

  final String nameOfPage;
  final ListView listView;

  NavigationDrawerMenuPage({required this.nameOfPage, required this.listView});

  Widget headerWidget() {
    return Row(
      children: [
        const SizedBox(width: 20,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('CCIPTVVideoPlayer',
                style: TextStyle(fontSize: 14, color: Colors.white)),
            SizedBox(height: 10,),
            Text(this.nameOfPage, style: TextStyle(fontSize: 14, color: Colors.white)),
            SizedBox(height: 20),
            SizedBox(
              height: 40,
              width: 200,
              child: ElevatedButton(
                onPressed: null,
                child: Text("Home"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              children: [
                headerWidget(),
                const SizedBox(height: 40),
                const Divider(thickness: 1, height: 10, color: Colors.grey),
                const SizedBox(height: 40),
                listView,
              ],
            ),
          ),
        ),
      ),
    );
  }
}


