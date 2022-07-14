import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}
class _MessagePageState extends State<MessagePage> {
  final dbRef = FirebaseDatabase.instance.reference().child("SMS");
  final List lists=[];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('رسائل'),
        ),
        body: Container(
          child: Flexible(
            child: StreamBuilder(
              stream: dbRef.onValue,
              builder: (context, AsyncSnapshot<Event> snapshot) {
                if (snapshot.hasData) {
                  lists.clear();
                  DataSnapshot dataValues = snapshot.data.snapshot;
                  Map<dynamic, dynamic> values = dataValues.value;
                  values.forEach(
                    (key, values) {
                      lists.add(values);
                    },
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
