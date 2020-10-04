import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:podiya/pages/HomePage.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>['email']);
FirebaseAuth _auth = FirebaseAuth.instance;

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return fullscreen(context);
  }

  _handleSignIn(BuildContext context) async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await _auth.signInWithCredential(credential);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  fullscreen(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/splash.jpg"), fit: BoxFit.cover),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          margin: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("WELCOME",
                  style: TextStyle(
                      color: Colors.white38,
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
              SizedBox(height: 16.00),
              Text("Your event \n is waiting \n for you.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w800)),
              SizedBox(height: 164.00),
              GoogleSignInButton(
                darkMode: false,
                onPressed: () => _handleSignIn(context),
                borderRadius: 16,
              ),
              SizedBox(height: 48.00),
            ],
          ),
        ),
      ),
    );
  }
}
