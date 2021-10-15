import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:podiya/pages/CheckAuthPage.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
            padding:
            MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(16))),
        child: Text("Вийти"),
        onPressed: () async {
         FirebaseAuth.instance.signOut();
         Navigator.pushReplacement(
           context,
           MaterialPageRoute(builder: (context) => CheckAuthPage()),
         );
        },
      ),
    );
  }
}
