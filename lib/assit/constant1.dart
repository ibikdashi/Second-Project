import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
const kIndigo = Color(0XFF3f51b5);
const kLabelTextStyle = TextStyle(color: Color(0XFF34a5c1),fontSize: 16.0,);
const kLabelBTitleTextStyle = TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold, color: Color(0XFF3f51b5));
const kLabelTitleTextStyle = TextStyle(fontSize: 22.0,fontWeight: FontWeight.normal, color: Color(0XFF3f51b5));
const kLabelPhoneTextStyle = TextStyle(fontSize: 20.0,fontWeight: FontWeight.normal,color: Color(0XFF007AFF));

Container boxproduct(String data) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
    alignment: Alignment.centerRight,
    child: Text(
      data,
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      style: kLabelTextStyle,
    ),
  );
}

Container pTitle(String title){
  return Container(
    margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
    alignment:Alignment.centerRight,
    child: Text(
      title,
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      style:kLabelBTitleTextStyle ,
    ),
  );
}
Container nTitle(String title){
  return Container(
    margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
    alignment:Alignment.centerRight,
    child: Text(
      title,
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      style:kLabelTitleTextStyle ,
    ),
  );
}
Container wBoxproduct(String data) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
    alignment: Alignment.centerRight,
    child: Text(
      data,
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      style: TextStyle(color: Colors.white,fontSize: 16.0,),
    ),
  );
}