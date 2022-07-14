import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import '../assit/header_image.dart';
import '../assit/constant.dart';

class UserMessage extends StatelessWidget {
  //final dbRef = FirebaseDatabase.instance.reference().child("USER_SMG");
  final dbRef = FirebaseDatabase.instance.reference().child("SMS");
  final List lists=[];
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Color(0XFF3f51b5),),
          title: HeaderImage(),
        ),
        body: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      child: Text('Title',style: kMessageTitleTextStyle,),
                    ),
                    Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: lists.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Title: " + lists[index]["title"]),
                                ],
                              ),
                            );
                          } ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.0,
                ),
                Column(

                ),
              ],
            ),
            FutureBuilder(
                future: dbRef.once(),
                builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    lists.clear();
                    Map<dynamic, dynamic> values = snapshot.data.value;
                    values.forEach((key, values) {
                      lists.add(values);
                    });
                    return new ListView.builder(
                        shrinkWrap: true,
                        itemCount: lists.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Title: " + lists[index]["title"]),
                                Text("Message: "+ lists[index]["message"]),
                                //Text("Type: " +lists[index]["type"]),
                              ],
                            ),
                          );
                        });
                  }
                  return CircularProgressIndicator();
                }),
          ],
        ),
      ),
    );
  }
}