import 'package:flutter/material.dart';
import 'constant.dart';


Widget createHeader() {
  return DrawerHeader(
    margin: EdgeInsets.zero,
    padding: EdgeInsets.zero,
    decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image:  AssetImage('images/emkanlogo.png'))),
    child: Stack(children: <Widget>[
    ],),);
}
Color _color = Color(0XFF007AFF);
Color _bcolor = kIndigo ;
Widget createDrawerItem(
    {@required IconData icon,@required String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
    //    Icon(icon),
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Directionality(textDirection: TextDirection.rtl,child: Text(text,style: TextStyle(color:_color,fontSize: 18.0,fontWeight: FontWeight.normal),textAlign: TextAlign.right,textDirection: TextDirection.rtl,)),
        ),
        Icon(icon,color: _bcolor,),
      ],
    ),
    onTap: onTap,
  );
}