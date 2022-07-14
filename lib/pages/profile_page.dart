import 'package:emkanclient/assit/header_image.dart';
import 'package:emkanclient/assit/profile-info.dart';
import 'package:emkanclient/pages/second_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  static final String idScreen = "profilePage";
  // final String lnumber;
  // final String phone;
  final bool logged;
  final bool balance;
  final bool profile;
  const ProfilePage({Key key, @required this.balance,@required this.profile, @required this.logged,}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  void initState() {
    balanceV(widget.balance);
    //_phone = phoneController.text = widget.phone.toString();
    if (widget.logged == true) {
      getData();
      print("logged");
    } else {
      if (_phone == null) {
        print(_phone);
      }
    }
    super.initState();
  }

  void balanceV(bool b) {
    if (b != true) {
      balance = false;
      profile =true;
      update = true;
    } else {
      balance = true;
      update = false;
      profile=false;
    }
  }

  @override
  //final dbRef = FirebaseDatabase.instance.reference().child("profile");
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final fNameController = TextEditingController();

  final lNameController = TextEditingController();

  final loanController = TextEditingController();
  DatabaseReference ref = FirebaseDatabase.instance.reference().child("balance");
  final paymentController = TextEditingController();
  final emailController = TextEditingController();
  final balanceController = TextEditingController();
  final phoneController = TextEditingController();
  final dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String _phone, _email;

  String _fName;

  String _lName;

  String _loan, _payment,_balance;

  String _date;
  bool balance = false;
  bool profile = true;
  bool update = true;
  Color _color = Color(0XFF007AFF);

  Color _mbcolor = Color(0XFFb4bec4);

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: _mbcolor,
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                // CircleAvatar(
                //   child: Image.asset('images/logo.png'),
                //   maxRadius: 70,
                //   backgroundColor: Colors.white,
                // ),
                Text(
                  'أهلاٌ و سهلاٌ',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'SourceSansPro',
                    color: Colors.red[400],
                    letterSpacing: 2.5,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 200,
                  child: Divider(
                    color: Colors.teal[100],
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                     Visibility(
                       visible: false,
                       child: Column(
                         children: [
                           ProfileInfo(
                             keyboard: TextInputType.emailAddress,
                             name: fNameController,
                             label: "البريد الإلكتروني",
                             message: "الرجاء إدخال البريد الإلكتروني",
                             icons: Icons.email,
                             variable: _email,
                             readonly: true,
                           ),
                           SizedBox(
                             height: 10,
                           ),
                           ProfileInfo(
                             keyboard: TextInputType.text,
                             name: fNameController,
                             label: "الإسم",
                             message: "الرجاء إدخال الإسم",
                             icons: Icons.person,
                             variable: _fName,
                             readonly: false,
                           ),
                           SizedBox(
                             height: 10,
                           ),
                           ProfileInfo(
                               keyboard: TextInputType.text,
                               name: lNameController,
                               label: "العائلة",
                               message: "الرجاء إدخال العائلة",
                               icons: Icons.person,
                               variable: _lName,
                               readonly: false),
                         ],
                       ),
                     ),
                      SizedBox(
                        height: 10,
                      ),
                      Visibility(
                        visible: true,
                        child: Column(
                          children: [
                            ProfileInfo(
                                keyboard: TextInputType.phone,
                                name: phoneController,
                                label: "رقم الهاتف",
                                message: "الرجاء إدخال رقم الهاتف",
                                icons: Icons.phone,
                                variable: _phone,
                                readonly: true),
                            SizedBox(
                              height: 10,
                            ),
                            ProfileInfo(
                              keyboard: TextInputType.number,
                              name: loanController,
                              label: "رقم الطلب",
                              message: "الرجاء إدخال رقم الطلب",
                              icons: Icons.file_present,
                              variable: _loan,
                              readonly: true,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ProfileInfo(
                                keyboard: TextInputType.number,
                                name: paymentController,
                                label: "قيمة السند",
                                message: "الرجاء إدخال قيمة السند",
                                icons: Icons.monetization_on,
                                variable: _payment,
                                readonly: true),
                            SizedBox(
                              height: 10,
                            ),
                            Column(children: [
                              ProfileInfo(
                                  keyboard: TextInputType.datetime,
                                  name: dateController,
                                  label: "تاريخ إستحقاق آخر سند",
                                  message:
                                      "الرجاء إدخال تاريخ إستحقاق آخر سند ",
                                  icons: Icons.date_range,
                                  variable: _date,
                                  readonly: true),
                              SizedBox(
                                height: 10.0,
                              ),
                             Visibility(visible: profile,child:  RaisedButton(
                               onPressed: () => _selectDate(context),
                               child: Text('حدد تاريخ'),
                             ),)
                            ]),
                            Visibility(visible:balance, child: ProfileInfo(
                                keyboard: TextInputType.number,
                                name: paymentController,
                                label: "قيمة الرصيد",
                                message: "الرجاء إدخال قيمة الرصيد",
                                icons: Icons.monetization_on,
                                variable: _balance,
                                readonly: true),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 20.0,
                    ),
                    Visibility(
                      visible: balance,
                      child: RaisedButton(
                        onPressed: (){ snapInfo(ref.child(loanController.text),"balance", balanceController);},
                        child: Text(
                          'رصيد',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: _color),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: update,
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            //updatinfo();
                          }
                        },
                        child: Text(
                          'تحديث',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: _color),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecondPage()));
                        });
                      },
                      child: Text(
                        'إلغاء',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: _color),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
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

  void getData() async {
    User user = await _auth.currentUser;
    String userId = user.uid;
    DatabaseReference reference = FirebaseDatabase.instance.reference().child("profile").child(userId);

    reference.once().then((DataSnapshot data) {
      print("message" + data.value.toString());
      if (data.value != null) {
        // snapInfo(reference, "Email", emailController,);
        // snapInfo(reference, "Name", fNameController,);
        // snapInfo(reference, "Lastname", lNameController);
        snapInfo(reference, "Phone", phoneController);
        snapInfo(reference, "payment", paymentController);
        snapInfo(reference, "lnumber", loanController);
        snapInfo(reference, "date", dateController);
        snapInfo(ref.child(loanController.text), "balance", balanceController);
      } else
        return CircularProgressIndicator();
        //toastDisplay("there is NO data", context);
    });
  }

  void snapInfo(DatabaseReference u, String x, TextEditingController text) {
    DatabaseReference data = u.child(x);
    data.once().then((DataSnapshot snap) {
      if (snap != null) {
        text.text = snap.value;
        print(snap.value);
        //toastDisplay("message" + snap.value, context);
      } else
        text.text = "No Data";
      //toastDisplay("There is no Data", context);
    });
  }

  void updatinfo() async {
    User user = await _auth.currentUser;
    String userId = user.uid;
    print(userId);
    DatabaseReference reference =
        FirebaseDatabase.instance.reference().child("profile").child(userId);
    print("result:"+ reference.toString());
    var result = reference.update({
      "phone":phoneController.text.trim(),
      "lnumber":loanController.text.trim(),
      "paymnet": paymentController.text.trim(),
       "date": dateController.text.trim(),
    });
    print("result:"+ result.toString());
    if (result == null) {
      //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(logged: true)));
      toastDisplay("Your Profile Updated Successfully", context);
    } else
      //register();
      toastDisplay("Your Profile not Updated Successfully", context);
  }

  void toastDisplay(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}
