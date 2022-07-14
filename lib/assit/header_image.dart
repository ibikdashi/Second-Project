import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/header.png',
            fit: BoxFit.contain,
            height: 50,
          )
        ],
      ),
    );
  }
}
//    return Container(
//    margin: EdgeInsets.symmetric(vertical: 10.0),
//width: 240.0,
//height: 50.0,
//decoration: BoxDecoration(
//image: DecorationImage(
//image: AssetImage('images/header.png'),
//),
//),
//);
