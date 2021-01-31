import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:podiya/dao/UserDataDao.dart';
import 'package:podiya/model/UserData.dart';
import 'package:podiya/pages/AuthPage.dart';
import 'package:podiya/pages/HomePage.dart';
import 'package:podiya/state/homeState.dart';
import 'package:provider/provider.dart';

import 'SplashPage.dart';
import 'WizardPage.dart';

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
      Firebase.initializeApp().then((value) async {
        User user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          bool userDataExist = await this.userInfoExist(context);

          if (userDataExist) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => WizardPage()),
            );
          }
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

  userInfoExist(context) async {
    HomeState homeState = Provider.of<HomeState>(context, listen: false);
    try {
      UserData userData = await UserDataDao.getData();
      homeState.setUserData(userData);
      return true;
    } catch (e) {
      return false;
    }
  }
}
