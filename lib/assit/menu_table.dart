import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  Menu({@required this.lassetname,@required this.rassetname,@required this.R,@required this.ltext,@required this.rtext,this.context,this.lsecondroute,this.rsecondroute}) ;
  final AssetImage lassetname;
  final AssetImage rassetname;
  final double R;
  final String ltext;
  final String rtext;
  final BuildContext context;
  final Widget lsecondroute;
  final Widget rsecondroute;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => lsecondroute));},
                child: CircleAvatar(
                  backgroundImage: lassetname,
                  radius: R,
                ),
              ),
              Text(ltext,textAlign: TextAlign.center,),
            ],
          ),
        ),
      SizedBox(
        width: 10.0,
      ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap:(){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => rsecondroute)
                  );},
                child: CircleAvatar(
                  backgroundImage: rassetname,
                  radius: R,
                ),
              ),
              Text(rtext,textAlign: TextAlign.center,),
            ],
          ),
        ),
      ],
    );
  }
}