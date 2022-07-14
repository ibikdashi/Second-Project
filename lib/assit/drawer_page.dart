import 'package:flutter/material.dart';

Widget createHeader() {
  return DrawerHeader(
    margin: EdgeInsets.zero,
    padding: EdgeInsets.zero,
    decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.contain, image: AssetImage('images/logo.jpg'))),
  );
}

Widget createDrawerItem({
  @required IconData icon,
  @required String text,
  GestureTapCallback onTap,
}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text),
        )
      ],
    ),
    onTap: onTap,
  );
}