import 'package:flutter/material.dart';
import '../assit/constant.dart';

class ProfileInfo extends StatelessWidget {
  final TextEditingController name;
  final String message;
  final String label;
  final IconData icons;
  final bool readonly;
  String variable;
  final TextInputType keyboard;


  ProfileInfo({ @required this.keyboard,@required this.name,@required this.label, @required this.message,@required this.icons,@required this.variable,@required this.readonly});
  @override
  Color _color = Color(0XFF007AFF);
  Color _bcolor = kIndigo ;

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
            readOnly:readonly ,
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            decoration: InputDecoration(
                labelText: label,
                labelStyle: TextStyle(color:_color,fontSize: 18.0,),
                hintStyle: TextStyle(color: _color),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                icon: Icon(icons, color: _bcolor),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return message;
              }
              return null;
            },
             onSaved: (value) => variable = value,
             //onChanged: (value) => variable = value,
          ),
      ),
      );
  }
}
