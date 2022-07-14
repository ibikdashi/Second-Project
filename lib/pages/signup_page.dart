import 'package:emkanclient/assit/header_image.dart';
import 'package:emkanclient/assit/login-info.dart';
import 'package:emkanclient/pages/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';


class SignupOnePage extends StatefulWidget {
  static String idScreen = "register_page";
  @override
  _SignupOnePageState createState() => _SignupOnePageState();
}

class _SignupOnePageState extends State<SignupOnePage> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final dbRef = FirebaseDatabase.instance.reference().child("profile");
  final dbRefp = FirebaseDatabase.instance.reference().child("player_ID");
  final paymentController = TextEditingController();

  final dateController = TextEditingController();
  final loanController = TextEditingController();

  final phoneController = TextEditingController();

  Color _color = Colors.blue.shade200;
  Color _dColor= Colors.blue.shade400;
  Color _bColor = Colors.blue;
  String smsCode;
  String verificationCode;
  var playerId;
  String _payment, _date;
  String _phone,_loan;
  var _id;

  String _status;

  User _firebaseUser;

  Color lColor,phColor,pColor,dColor;

  int _code;

  Widget _buildPageContent(BuildContext context) {
    return Scaffold(
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
      body: Container(
        color: _color,
        child: ListView(
          children: <Widget>[
            SizedBox(height: 15.0,),
            _buildLoginForm(context),
          ],
        ),
      ),
    );
  }
  void initState() {
    super.initState();
    _getFirebaseUser();
    _playeridhandeler();
  }
// void getuid()async{
//   final user = await _auth.currentUser;
//   final userid = user.;
//   print("UID:"+userid.toString());
//
// }
  void _handleError(e) {
    print(e.message);
    setState(() {
      _status += e.message + '\n';
    });
  }
  Future<void> _getFirebaseUser() async {
    this._firebaseUser = await FirebaseAuth.instance.currentUser;
    setState(() {
      _status =
      (_firebaseUser == null) ? 'Not Logged In\n' : 'Already LoggedIn\n';
    });
  }

  Form _buildLoginForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Stack(
          children: <Widget>[
            ClipPath(
              clipper: RoundedDiagonalPathClipper(),
              child: Container(
                //hight of the main controller
                height: 550,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20.0,),
                    LoginInfo(keyboard: TextInputType.number, name: loanController, label: "رقم الطلب", message: "الرجاء إدخال رقم الطلب", icons: Icons.file_present, variable: _loan,checkColor: lColor,),
                    Container(child: Divider(color: _dColor,),
                      padding: EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 10.0),),
                    LoginInfo(keyboard: TextInputType.phone, name: phoneController, label: "رقم الهاتف", message: "الرجاء إدخال رقم الهاتف", icons: Icons.phone, variable: _phone,checkColor: phColor,),
                    Container(child: Divider(color:_dColor,),
                      padding: EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 10.0),),
                    LoginInfo(keyboard: TextInputType.number, name: paymentController, label: "قيمة السند", message: "الرجاء إدخال قيمة السند", icons: Icons.monetization_on, variable: _payment,checkColor: pColor,),
                    Container(child: Divider(color: _dColor,),
                      padding: EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 10.0),),
                    Column(
                      mainAxisAlignment:MainAxisAlignment.center ,
                      children: [
                        LoginInfo(keyboard: TextInputType.datetime, name: dateController, label: "تاريخ إستحقاق آخر سند", message: "الرجاء إدخال تاريخ إستحقاق آخر سند", icons: Icons.date_range, variable: _date,checkColor: dColor,),
                        Divider(color: _dColor,),
                        ElevatedButton(onPressed:(){
                          _selectDate(context);},
                            child: Text("تاريخ إستحقاق آخر سند")),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text('$_status'),
                    SizedBox(height: 10.0,),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  //change the signup high
                  height: 550,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RaisedButton(
                      onPressed: () async {
                        //dbRef.child('1').push().set
                        if (_formKey.currentState.validate()) {
                         //  _checkloan();
                           if(lColor==Colors.green && phColor==Colors.green && pColor==Colors.green && dColor==Colors.green)
                             {
                               print("good");
                               _submit();
                             }
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                      child: Text(
                          "إنشاء", style: TextStyle(color: Colors.white70)),
                      color: _bColor,
                    ),
                  ),
                ),
                Container(
                  //change the signup high
                  height: 550,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RaisedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          _checkloan();
                          // if(lColor==Colors.green && phColor==Colors.green && pColor==Colors.green && dColor==Colors.green)
                          //   {
                          //     print("good");
                          //     _submit();
                          //   }
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                      child: Text(
                          "check data", style: TextStyle(color: Colors.white70)),
                      color: _bColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  DateTime now = DateTime.now();
  DateFormat formatter = DateFormat('dd-MM-yyyy');
  Future<void> _selectDate(BuildContext context) async {
    //dateController.text = "${now.toLocal()}".split(' ')[0];
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != now)
      setState(() {
        now = picked;
        String dateformatted = formatter.format(picked);
        dateController.text = "${dateformatted}".split(' ')[0];
      });
  }
  Future<void> _submit() async {
    String phoneNumber = "+961 " + phoneController.text.toString().trim();
    print(phoneNumber);


    final PhoneVerificationCompleted verificationSuccess = (
        AuthCredential credential) {
      print('verificationCompleted');
      setState(() {
        _status += 'verificationCompleted\n';
        print(credential);
      });
    };
    //Listens for errors with verification, such as too many attempts
    final PhoneVerificationFailed phoneVerificationFailed = (
        FirebaseAuthException error) {
      print('verificationFailed');
      _handleError(error);
    };
    final PhoneCodeSent phoneCodeSent = (String verId, [int forceCodeResend]) {
      print('codeSent');
      print(verId);
      this.verificationCode = verId;
      this._code = forceCodeResend;
      print(forceCodeResend.toString());
      setState(() {
        _status += 'Code Sent\n';
      });
      smsCodeDialog(context).then((value) => print("Signed In"));
    };

    final PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout = (String verId) {
      this.verificationCode = verId;
    };

// call function from phone verification.dart
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: verificationSuccess,
        verificationFailed: phoneVerificationFailed,
        codeSent: phoneCodeSent,
        codeAutoRetrievalTimeout: autoRetrievalTimeout
    );
  }
  Future<bool> smsCodeDialog(BuildContext context){
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("أدخل الرمز",
              style: TextStyle(
                color: Colors.blue[900],
              ),
            ),
            content: TextField(
              onChanged: (Value){
                smsCode=Value;
              },
            ),
            contentPadding: EdgeInsets.all(10),
            actions: <Widget>[
              FlatButton(
                child: Text("التحقق",
                  style: TextStyle(
                    color: Colors.green[900],
                  ),
                ),
                onPressed: (){
                  User user=FirebaseAuth.instance.currentUser;
                  print("user:"+user.toString());
                  if(user!=null){
                    //Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage(logged: true,profile: true,balance: false,)),
                    );
                  }
                  else{
                    //_setplayerid();
                    //Navigator.of(context).pop();
                    signIn(verificationCode,smsCode,context);
                   // MaterialPageRoute(builder: (context) => ProfilePage(logged: true,profile: true,balance: false,));
                  }
                },
              )
            ],
          );
        }
    );
  }

  void signIn(String code,String sms,BuildContext context) {
    AuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: code, smsCode: sms);
    FirebaseAuth.instance.signInWithCredential(phoneAuthCredential)
        .then((user) {
          _id=user.user.uid;
          print("uID:"+_id);
          _register();
      //Navigator.push(context, MaterialPageRoute(builder: (context) =>ProfilePage(balance: false, profile: true, logged: true)),);
    }

    ).catchError((e) => print(e));
  }

  void _setplayerid() {
    try {
      Map UserDataMap = {
        "playerid": playerId.toString(),};
      dbRefp.child(loanController.text.trim()).set(UserDataMap);
    }on FirebaseAuthException catch (e){
      _handleError(e);
    }
  }
  void _register() async {

    try {
        Map UserDataMap = {
          "payment": paymentController.text.trim(),
          "date": dateController.text.trim(),
          "Phone": phoneController.text.trim(),
          "lnumber":loanController.text.trim(),
          "playerid":playerId.toString(),
        };
       var result= dbRef.child(_id).set(UserDataMap);
        print("Successfully");
        toastDisplay('Congratulation the User was created Successfully', context);
        _setplayerid();
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage(logged: true,balance: false,profile: true,)));
    } on FirebaseAuthException catch (e) {
      _handleError(e);
    }
    }
  void _checkloan()async{
    DatabaseReference refernce = FirebaseDatabase.instance.reference().child("balance");
    refernce.once().then((DataSnapshot snap) {
      //check if there is data
      var key1=snap.key;
      if (snap != null) {
        print("first key:"+key1);
        snapInfo(refernce,loanController.text);
      } else
        print("no data");
      //toastDisplay("There is no Data", context);
    });
  }
  void snapInfo(DatabaseReference ref,String child1 ) {
    DatabaseReference data = ref.child(child1);
    data.once().then((DataSnapshot snap) {
      // check if the key is user loan number
      var value=snap.value;
      print("value:"+snap.value.toString());
      if(value!=null){
        print("Loan number is correct");
        setState(() {
          lColor=Colors.green;
          _status="Loan number is correct"+ '\n';
        });
        snapvalue(data, "phone", _phone,phoneController);
        snapvalue(data, "payment", _payment,paymentController);
        snapvalue(data, "date", _date, dateController);
      }else
        setState(() {
          lColor=Colors.red;
          pColor=Colors.red;
          phColor=Colors.red;
          dColor=Colors.red;
          _status="Loan number is incorrect";
        });
      print("Loan number is incorrect");
    }
    );
  }
  void snapvalue(DatabaseReference u, String x, String text, TextEditingController controller) {
    DatabaseReference data = u.child(x);
    String status;
    data.once().then((DataSnapshot snap) {
      var key= snap.key.toString();
      print("key"+key);
      text = snap.value.toString();
      if(text==controller.text) {
        print(text);
        if(key=="phone") {
          phColor = Colors.green;
          _status = x + "is correct" + '\n';
          print(x + "is correct");
          print("value:" + text);
        }else if(key=="payment"){
          pColor = Colors.green;
          _status = x + "is correct" + '\n';
          print(x + "is correct");
          print("value:" + text);
        }else {
          dColor=Colors.green;
          _status = x + "is correct" + '\n';
          print(x + "is correct");
          print("value:" + text);
        }
      }else
      if(key=="phone") {
        phColor = Colors.red;
        _status = x + "check the data" + '\n';
        print(x + "check the data");
      }else if(key=="payment") {
        pColor = Colors.red;
        _status = x + "check the data" + '\n';
        print(x + "check the data");
      }else {
        dColor = Colors.red;
        _status = x + "check the data" + '\n';
        print(x + "check the data");
      }
    });
  }
    @override
    void dispose() {
      paymentController.dispose();
      phoneController.dispose();
      dateController.dispose();
      loanController.dispose();
      super.dispose();
    }
    void _playeridhandeler()async{
      var stat = await OneSignal.shared.getPermissionSubscriptionState();
      playerId = stat.subscriptionStatus.userId;
      //_status=playerId.toString();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: _buildPageContent(context),
      );
    }
  }

  void toastDisplay(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
// showAlertDialog(errorMsg) {
//   return showDialog(
//       // context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text(
//             'Login Failed',
//             style: TextStyle(color: Colors.black),
//           ),
//           content: Text(errorMsg),
//         );
//       });
// }