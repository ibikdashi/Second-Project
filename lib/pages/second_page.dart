import 'package:emkanclient/assit/dropdown_page.dart';
import 'package:emkanclient/pages/login_page.dart';
import 'package:emkanclient/pages/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import '../assit/menu_table.dart';
import '../assit/header_image.dart';
import 'product_page.dart';
import 'payment_page.dart';
import 'location_page.dart';
import 'branches_page.dart';
import 'web_page.dart';
import 'message.dart';

class SecondPage extends StatefulWidget {
  static final String idScreen= "homepage";
  //final bool logged;

  //const SecondPage({Key key, this.logged}) : super(key: key);
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  bool _login=true;
  bool _profile=false;
  User _firebaseUser;

  String _status;
  void initState() {
    _getFirebaseUser();
    initOneSignalMethod();
    super.initState();
  }
  Future<void> _getFirebaseUser() async {
    this._firebaseUser = await FirebaseAuth.instance.currentUser;
    setState(() {
      _status =(_firebaseUser == null) ? "NO" : "yes";
      print(_status);
      if(_firebaseUser==null){
        print("true");
        _login=true;
        _profile=false;
      }else {
        print("loggin");
        _login = false;
        _profile = true;
      }

    });
  }
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    _login=true;
    _profile=false;
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondPage()));
    toastDisplay("You Signed_Out Successfully ", context);
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=> _onBackPressed(context),
      child: MaterialApp(
        home: Scaffold(
          key: _key,
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Color(0XFF3f51b5),),
            title: HeaderImage(),
            leading: IconButton(icon:Icon(Icons.menu), onPressed: (){_key.currentState.openDrawer();
            },),
          ) ,
          // drawer: drop(context),
         drawer: SafeArea(
             child: Drawer(child: ListView(
               padding: EdgeInsets.zero,
               children: <Widget>[
                 createHeader(),
                 Visibility(
                   visible:_login,
                   child:
                   createDrawerItem(icon: Icons.login,text: 'تسجيل الدخول',onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()),) ),
                 ),
                 Visibility(
                     visible: _profile,
                     child:Column(
                       children: [
                         createDrawerItem(icon: Icons.person_pin, text: 'ملفي',onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage(logged:true,balance: false,profile: true,)))),
                         createDrawerItem(icon: Icons.history, text: 'رصيد',onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage(balance: true, profile: false, logged: true)))),
                         createDrawerItem(icon: Icons.logout, text: 'خروج',onTap: (){_signOut();}),
                       ],
                     )
                 ),
                 Divider(),
                 createDrawerItem(icon: Icons.notifications, text: 'Notification',onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()),)),
               ],
             ),
             ),
         ),
          body:
          SafeArea(
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    //Image Container
                    Container(
                      child: Column(
                        children: <Widget>[
                         // HeaderImage(),
                          Container(
                            width: 700.0,
                            height: 200.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('images/slideshow.gif'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ), //Images Column
                Container(
                  margin: EdgeInsets.only(top:10.0,left: 10.0,right: 10.0),
                  //Table Container
                  child: Table(
                    children: [
                      TableRow(
                        children: [
                          //first Row
                          TableCell(
                            child: Menu(
                              lassetname: AssetImage('images/hand85x85.png'),
                              rassetname: AssetImage('images/loan2285x85.png'),
                              R: 35.0,
                              ltext: 'المنتجات',
                              rtext: 'الحصول على قرض',
                              lsecondroute: Products(),
                              rsecondroute: MyWebView(title:'الحصول على قرض',selectedUrl: "http://www.emkanfinance.com/LoanInquiry1.aspx?language=ar"),
                            ),
                          ),
                        ],
                      ), //first Row
                      TableRow(
                        //Second Row
                        children: [
                          TableCell(
                            child: Menu(
                              lassetname:
                                  AssetImage('images/coverage85x85.png'),
                              rassetname: AssetImage('images/85x85.png'),
                              R: 35.0,
                              ltext: 'التغطية الجغرافية',
                              rtext: 'الفروع',
                              lsecondroute: Location(),
                              rsecondroute: Ebranches(),
                            ),
                          )
                        ],
                      ), //Second Row
                      TableRow(
                        //third Raw
                        children: [
                          TableCell(
                            child: Menu(
                                lassetname: AssetImage('images/loan85x85.png'),
                                rassetname: AssetImage('images/job85x85.png'),
                                R: 35.0,
                                ltext: 'مراكز الدفع',
                                rtext: 'وظائف شاغرة',
                              lsecondroute: PaymentMethods(),
                              rsecondroute: MyWebView(title: 'وظائف شاغرة', selectedUrl: "http://www.emkanfinance.com/CareerDetails1.aspx?id=1&language=ar"),
                            ),

                          ),
                        ],
                      ), //third Raw
                      TableRow(
                        //Fourth Raw
                        children: [
                          TableCell(
                            child: Menu(
                                lassetname: AssetImage('images/email85x85.png'),
                                rassetname: AssetImage('images/calll.png'),
                                R: 35.0,
                                ltext: 'رسائل',
                                rtext: 'إتصل بنا',
                              lsecondroute: Home(),
                              rsecondroute:MyWebView(title: 'إتصل بن', selectedUrl: "http://www.emkanfinance.com/ContactUs1.aspx?language=ar") ,
                            ),
                          ),
                        ],
                      ), //Fourth Raw
                    ],
                  ),
                ) //Table Container
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        //title: new Text('Are you sure?'),
        content: Row(
          crossAxisAlignment:CrossAxisAlignment.end ,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new Text('هل تريد حقاً الخروج؟'),
          ],
        ),
        actions: <Widget>[
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: Text("كلا"),
          ),
          SizedBox(height: 16),
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(true),
            child: Text("نعم"),
          ),
        ],
      ),
    ) ??
        false;
  }
  Future < void >  initOneSignalMethod () async {
    String _debugLabelString = "";
    await  OneSignal .shared. init ( "fb76840b-bad4-4af2-89f9-e22d613a84a5" );
    OneSignal .shared
        . setInFocusDisplayType ( OSNotificationDisplayType .notification);

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      this.setState(() {_debugLabelString =
      "Opened notification: \n${result.notification.jsonRepresentation().replaceAll("\\n", "\n")}";
      });
    });

    OneSignal .shared
        . setNotificationOpenedHandler (( OSNotificationOpenedResult result) {
      print ( 'Clicked on tray' );
    });
  }
}

