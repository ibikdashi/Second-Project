import 'package:emkanclient/assit/header_image.dart';
import 'package:emkanclient/pages/profile_page.dart';
import 'package:emkanclient/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:emkanclient/assit/login-info.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  static String idScreen = "login_page";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  @override

  Color _color = Colors.blue.shade200;
  Color _dcolor = Colors.blue.shade400;
  Color _bcolor = Colors.blue;
  String smsCode;
  String verificationCode;
  User _firebaseUser;
  String _status;

  final _loanController = TextEditingController();

  final _phoneController = TextEditingController();

  String _loan;

  String _phone;
  Color phColor,lColor;

  int _code;

  void initState() {
    super.initState();
    _getFirebaseUser();
  }

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

  Widget _buildPageContent(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: HeaderImage(),
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            color: Color(0XFF3f51b5),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Container(
        color: _color,
        child: ListView(
          children: <Widget>[
            SizedBox(height: 30.0,),
            // CircleAvatar(child: Image.asset('images/logo.png',),
            //   maxRadius: 55,
            //   backgroundColor: Colors.white,),
            // SizedBox(height: 10.0,),
            _buildLoginForm(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context) => SignupOnePage()
                    ));
                  },
                  child: Text("Do not Have an account? Register Here.",
                      style: TextStyle(color: _bcolor, fontSize: 18.0)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Form _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Stack(
          children: <Widget>[
            ClipPath(
              clipper: RoundedDiagonalPathClipper(),
              child: Container(
                height: 400,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 10.0,),
                    LoginInfo(keyboard: TextInputType.number,
                      name: _loanController,
                      label: "رقم القرض",
                      message: "الرجاء إدخال رقم القرض",
                      icons: Icons.paste_rounded,
                      variable: _loan,checkColor: lColor,),
                    Container(child: Divider(color: _dcolor),
                      padding: EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 10.0),),
                    LoginInfo(keyboard: TextInputType.number,
                        name: _phoneController,
                        label: "رقم الهاتف",
                        message: "الرجاء إدخال رقم الهاتف",
                        icons: Icons.phone_android,
                        variable: _phone,checkColor: phColor,),
                    Container(child: Divider(color: _dcolor),
                      padding: EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 10.0),),
                    SizedBox(height: 5),
                    Text('$_status'),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 40.0,
                  backgroundColor: _bcolor,
                  child: Icon(Icons.person),
                ),
              ],
            ),
            Container(
              height: 400,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _checkloan(_loanController.text);

                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                  child: Text(
                      "دخول", style: TextStyle(color: Colors.white70)),
                  color: _bcolor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _loanController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageContent(context),
    );
  }
  void _checkloan(String loan)async{
    DatabaseReference refernce = FirebaseDatabase.instance.reference().child("balance");
    refernce.once().then((DataSnapshot snap) {
      //check if there is data
      var key1=snap.key;
      if (snap != null) {
        print("first key:"+key1);
        snapInfo(refernce,_loanController.text);
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
        snapvalue(data, "phone", _phone,_phoneController);
        //snapvalue(data, "balance", _status);
      }else
        setState(() {
          lColor=Colors.red;
          phColor=Colors.red;
          _status="Loan number is incorrect";
        });
      print("Loan number is incorrect");
    }
    );
  }
  void snapvalue(DatabaseReference u, String x, String text, TextEditingController controller) {
    DatabaseReference data = u.child(x);
    data.once().then((DataSnapshot snap) {
      var key= snap.key.toString();
      print("key"+key);
      text = snap.value.toString();
      if(text==controller.text) {
        print(text);
        if(key=="phone") {
          setState(() {
            phColor = Colors.green;
            _status = x + "is correct" + '\n';
          });
          _submit();
          print(x + "is correct");
          print("value:" + text);
        }
      }else
      if(key=="phone") {
        phColor = Colors.red;
        _status = x + "check the data" + '\n';
        print(x + "check the data");
      }
    });
  }
  Future<void> _submit() async {
    String phoneNumber = "+961 " + _phoneController.text.toString().trim();
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

  Future<bool> smsCodeDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("أدخل الرمز",
              style: TextStyle(
                color: Colors.blue[900],
              ),
            ),
            content:
            TextField(
              onChanged: (value) {
                smsCode = value;
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
                onPressed: () async {
                  User user = FirebaseAuth.instance.currentUser;
                  _status = user.toString();
                  print("user:" + user.toString());
                  if (user != null) {
                    //Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>
                            ProfilePage(logged: true,balance: false,profile: true,)));
                  }
                  else {
                    //Navigator.of(context).pop();
                    signIn(verificationCode, smsCode, context);
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
        .then((user) =>  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>ProfilePage(balance: true, profile: false, logged: true)),
    )).catchError((e) => print(e));
  }
    // void login()async{
    //   try {
    //      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    //         email:_loanController.text.trim() ,
    //         password: _phoneController.text.trim()
    //     );
    //      if(!userCredential.user.emailVerified){
    //        _handleError("please check you email");
    //      }
    //      else {
    //        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage(logged: true,balance: false,profile: true,)));
    //      }
    //   } on FirebaseAuthException catch (e) {
    //     _handleError(e);
    //     if (e.code == 'user-not-found') {
    //       print('No user found for that email.');
    //     } else if (e.code == 'wrong-password') {
    //       print('Wrong password provided for that user.');
    //     }
    //   }
    //
    // }
  }

  void toastDisplay(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
