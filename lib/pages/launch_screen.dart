import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'dart:async';
import 'second_page.dart';

class ViewWidget extends StatefulWidget {
  @override
  _ViewWidgetState createState() => _ViewWidgetState();
}

class _ViewWidgetState extends State<ViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Visibility(child: null),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _enableConsentButton;
  String _debugLabelString="";
  var playerId;
  var newNotificationTitle;
  var newNotificationBody;
  final dbRef = FirebaseDatabase.instance.reference().child("SMS");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
    initPlatformState();
  }
  
  startTime() async {
    return Timer(Duration(seconds: 5),
        route
    );
  }
  route(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondPage()),);
  }
  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    if (!mounted) return;

    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    //OneSignal.shared.setRequiresUserPrivacyConsent(_requireConsent);

    var settings = {
      OSiOSSettings.autoPrompt: false,
      OSiOSSettings.promptBeforeOpeningPushUrl: true
    };
    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      this.setState(() {
        _debugLabelString =
        "Opened notification: \n${result.notification.jsonRepresentation().replaceAll("\\n", "\n")}";
      });
    });

    OneSignal.shared
        .setInAppMessageClickedHandler((OSInAppMessageAction action) {
      this.setState(() {
        _debugLabelString =
        "In App Message Clicked: \n${action.jsonRepresentation().replaceAll("\\n", "\n")}";
      });
    });
    OneSignal.shared.setNotificationReceivedHandler((notification) {
      this.setState(() {
        _debugLabelString =
        "Received notification: \n${notification.jsonRepresentation().replaceAll("\\n", "\n")}";
         newNotificationTitle = notification.payload.title;
         newNotificationBody = notification.payload.body;
      });
    });
    OneSignal.shared
        .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
      print("SUBSCRIPTION STATE CHANGED: ${changes.jsonRepresentation()}");
    });
    // var status = await OneSignal.shared.getPermissionSubscriptionState();
    //  playerId = status.subscriptionStatus.userId;
    OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
      print("PERMISSION STATE CHANGED: ${changes.jsonRepresentation()}");
    });
    // NOTE: Replace with your own app ID from https://www.onesignal.com
    await OneSignal.shared
        .init("6db34dd4-a169-4dd7-890e-649356b11017", iOSSettings: settings);

    OneSignal.shared
        .setInFocusDisplayType(OSNotificationDisplayType.notification);

    bool requiresConsent = await OneSignal.shared.requiresUserPrivacyConsent();

    this.setState(() {
      _enableConsentButton = requiresConsent;
    });
  }
  void _savenotification() async {

    try {
      Map UserDataMap = {
        "Title": newNotificationTitle.text.trim(),
        //"Date": dateController.text.trim(),
        "Message": newNotificationBody.text.trim(),
      };
      var result= dbRef.set(UserDataMap);
      print("Successfully");
    } on FirebaseAuthException catch (e) {
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }
  initScreen(BuildContext context){
    return Scaffold(
      body: Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/logo1.gif'),
            Text(
              'بإمكانك',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlueAccent,
              ),
            ),
//            Padding(padding: EdgeInsets.only(top: 20.0)),
//            CircularProgressIndicator(
//              backgroundColor: Colors.white,
//              strokeWidth: 1,
//            ),
            ],
        ),
      ),
    );
  }
}
