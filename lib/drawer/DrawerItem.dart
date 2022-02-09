import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {Key? key,
      required this.name,
      required this.onPressed, this.color})
      : super(key: key);

  final String name;
  final Color? color;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 35,
        child: ElevatedButton(
          onPressed: this.onPressed,
          child: Text(this.name),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(this.color == null ? Colors.brown : this.color!),
          ),
        ),
      ),
    );
  }
}
