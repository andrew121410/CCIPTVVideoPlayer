import 'package:cc_iptv_video_player/screens/ChooseProviderMenu.dart';
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
    return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('CCIPTVVideoPlayer',
                style: TextStyle(fontSize: 14, color: Colors.white)),
            SizedBox(height: 10,),
            Text(this.nameOfPage, style: TextStyle(fontSize: 14, color: Colors.white)),
            SizedBox(height: 20),
            SizedBox(
              height: 40,
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseProviderMenu()));
                },
                child: Text("Home"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
                ),
              ),
            ),
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
                const SizedBox(height: 20),
                const Divider(thickness: 1, height: 10, color: Colors.grey),
                const SizedBox(height: 20),
                listView,
              ],
            ),
          ),
        ),
      ),
    );
  }
}


