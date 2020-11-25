import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:podiya/pages/AuthPage.dart';
import 'package:podiya/pages/HomePage.dart';

import 'SplashPage.dart';

class CheckAuthPage extends StatefulWidget {
  @override
  _CheckAuthPageState createState() => _CheckAuthPageState();
}

class _CheckAuthPageState extends State<CheckAuthPage> {
  @override
  void initState() {
    super.initState();
    Future(() {
      WidgetsFlutterBinding.ensureInitialized();
      Firebase.initializeApp().then((value) {
        User user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => AuthPage()),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SplashPage();
  }
}
