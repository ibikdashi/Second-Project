import 'package:firebase_core/firebase_core.dart';
import 'pages/launch_screen.dart';
import 'package:flutter/material.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //  OneSignal.shared.init("6db34dd4-a169-4dd7-890e-649356b11017");
  // OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.notification);
  // OneSignal.shared.setRequiresUserPrivacyConsent(false);
  runApp(EmkanClient());
}


class EmkanClient extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SplashScreen(),
    );
  }
}


