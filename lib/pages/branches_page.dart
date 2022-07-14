import 'package:flutter/material.dart';
import 'package:linkable/linkable.dart';
import '../assit/header_image.dart';
import '../assit/constant.dart';

class Ebranches extends StatelessWidget {
  List<int>hophoneNumber=[
    009611814901,
    009611814902,
    009611814903,];
  List<int>beirutphoneNumber=[
    009611703103,
    009611704304,
    009611705205,];
  List<int>saidaphoneNumber=[
    009617753693,
    009617753694,];
  List<int>tyrphoneNumber=[
    009617742741,
    009617741841,];
  List<int> halbaphoneNumber=[
  009616691690,
  009616691692,
  009616691591,];
  List<int>tripoliphoneNumber=[
    009616428870,
    009616428871,
    009616428872,];
  List<int>chtouraphoneNumber=[
    009618541950,
    009618542950,
    009618543950,];
  //int phone;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: HeaderImage(),
              leading: new IconButton(
                  icon:new Icon(Icons.arrow_back),
                  color: Color(0XFF3f51b5),
                  onPressed:() {
                    Navigator.pop(context);
                  }
              ),
            ),
            body: SingleChildScrollView(
              controller: ScrollController(),
              child: Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
                  children: <Widget>[
                    pTitle('الفروع '),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        nTitle('الفرع الرئيسي'),
                        boxproduct('شارع السادات، مبنى السادات، الطابق الخامس'),
                        PhoneBox(data:'هاتف:',number1:hophoneNumber[0],number2: hophoneNumber[1],number3: hophoneNumber[2],),
                        boxproduct('فاكس:  009611814900'),
                        boxproduct('صندوق البريد 11-350 بيروت، لبنان'),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        nTitle('فرع بيروت'),
                        boxproduct('مبنى اسكندراني، الطابق الثاني شارع الجامعة العربية - بيروت، لبنان'),
                        PhoneBox(data:'هاتف:',number1:beirutphoneNumber[0],number2: beirutphoneNumber[1],number3: beirutphoneNumber[2],),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        nTitle('فرع صيدا'),
                        boxproduct('مبنى شهاب، الطابق الثاني شارع رياض الصلح - صيدا، لبنان'),
                        PhoneBox(data: 'هاتف:',number1: saidaphoneNumber[0],number2: saidaphoneNumber[1],),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        nTitle('فرع طرابلس '),
                        boxproduct('مبنى محمد حربا، الطابق الأول مستديرة النور، شارع البولفارد - طرابلس، لبنان'),
                        PhoneBox(data: 'هاتف:',number1: tripoliphoneNumber[0],number2: tripoliphoneNumber[1],number3: tripoliphoneNumber[2],),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        nTitle('فرع صور '),
                        boxproduct('مبنى تاج الدين، الطابق الثاني شارع مصرف لبنان - صور، لبنان '),
                        PhoneBox(data: 'هاتف:',number1: tyrphoneNumber[0],number2: tyrphoneNumber[1],),
                      ],
                    ),
                  ],
                ),

              ),
            ),
          )
          
          ),
    );
  }
}
class PhoneBox extends StatefulWidget {
  PhoneBox({this.data,this.number1,this.number2, this.number3});
  final int number1;
  final int number2;
  final int number3;
  final String data;

  @override
  _PhoneBoxState createState() => _PhoneBoxState();
}
class _PhoneBoxState extends State<PhoneBox> {
  @override
  bool visible=true;
  void initState(){
    super.initState();
if(widget.number3==null){
  visible=false;
}
  }
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child:
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              Linkable(
                text:
                widget.number1.toString(),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: kLabelPhoneTextStyle,
              ),
              Linkable(
                text:
                widget.number2.toString(),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: kLabelPhoneTextStyle,
              ),
              Visibility(
                visible:visible ,
                child: Linkable(
                  text:
                  widget.number3.toString(),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: kLabelPhoneTextStyle,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            widget.data,
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            style: kLabelPhoneTextStyle,
          ),
        ],
      ),
    );
  }

  String checknumber3(String x){
    if (x.isEmpty){
      x="";
      return x;
    }
  }
}

