import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../assit/header_image.dart';
import '../assit/constant.dart';

class PaymentMethods extends StatelessWidget {
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                pTitle('مراكز الدفع'),
                boxproduct(
                    'تسدد القروض في فروع بنك البحر المتوسط المذكورة ادناه أو أحد وكلاء   OMT المعتمدين لدينا، وفقا للائحة التالية:'),
                pTitle('فروع بنك البحر المتوسط'),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        color: kIndigo,
                        width: 50.0,
                       margin: EdgeInsets.only(left: 10.0),
                        child: wBoxproduct('فروع بنك البحر المتوسط (30 فرع)'),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Container(
                        color: kIndigo,
                        margin: EdgeInsets.only(left: 10.0,right: 5.0),
                        child: wBoxproduct('فروع شركة إمكان المالية'),),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0,right: 5.0),
                        child: boxproduct('  البربير – الشياح  – خلدة – عاليه – بقعاتا (5 فروع)'),
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0,right: 5.0),
                        child: boxproduct('بيروت'),
                      ),
                    ),

                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0,right: 5.0),
                        child: boxproduct(' الميناء – المنية – كفرسارون – مرياتا (4 فروع)'),
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0,right: 5.0),
                        child: boxproduct('طرابلس'),
                      ),
                    ),

                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0,right: 5.0),
                        child: boxproduct(' شتورا – زحلة – جب جنين (3 فروع)'),
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0,right: 5.0),
                        child: boxproduct('شتورا'),
                      ),
                    ),

                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0,right: 5.0),
                        child: boxproduct('   صيدا – سينيق – مجدليون – الوسطاني – النبطية – الشحيم (6 فروع)'),
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0,right: 5.0),
                        child: boxproduct('صيدا'),
                      ),
                    ),

                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0,right: 5.0),
                        child: boxproduct('	  حلبا (فرع واحد)'),
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0,right: 5.0),
                        child: boxproduct('حلبا'),
                      ),
                    ),

                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0,right: 5.0),
                        child: boxproduct('  	  صور (فرع واحد)'),
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0,right: 5.0),
                        child: boxproduct('صور'),
                      ),
                    ),

                  ],
                ),
                Container(
                  child: pTitle(' وكلاء OMT'),
                ),
                boxproduct('بإمكانك تسديد مستحقاتك ل-"إمكان" عبر أكثر من 900 مركز أو. أم. تي في لبنان. لتحديد أقرب مركز أو. أم. تي ، الرجاء الإتصال على 01391000'),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
