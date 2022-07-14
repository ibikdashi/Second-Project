import 'package:flutter/material.dart';

class LoginInfo extends StatelessWidget {
  final TextEditingController name;
  final String message;
  final String label;
  final IconData icons;
  final Color checkColor;
  String variable;
  final TextInputType keyboard;


  LoginInfo({ @required this.keyboard,@required this.name,@required this.label, @required this.message,@required this.icons,@required this.variable,@required this.checkColor});
  @override
  //Color _color = Colors.blue.shade200;
 // Color _bcolor = Colors.blue;

  Widget build(BuildContext context) {
    return Container(
      alignment:Alignment.centerRight,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
            maxLengthEnforced: false,
            keyboardType:keyboard,
            controller: name ,
            textAlign: TextAlign.right,
            textDirection: TextDirection.ltr,
            decoration: InputDecoration(
                labelText: label,
                labelStyle: TextStyle(color:Colors.blue.shade200,fontSize: 16.0,),
                hintStyle: TextStyle(color:Colors.blue.shade200),
                border: InputBorder.none,
                icon: Icon(icons, color: Colors.blue),
              prefixIcon: Icon(Icons.check_circle_outline, color: checkColor,),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return message;
              }
              return null;
            },
             //onSaved: (value) => variable = value,
             onChanged: (value) => variable = value,
          ),
      ),
      );
  }
}
