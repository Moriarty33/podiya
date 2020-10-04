import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in/widgets.dart';
import 'package:podiya/model/Identity.dart';
import 'package:podiya/pages/AuthPage.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0.0,
        title: Text(title),
        centerTitle: false,
        backgroundColor: Colors.black54,
        automaticallyImplyLeading: false,
        actions: this.actions(_auth.currentUser, context));
  }

  List<Widget> actions(user, BuildContext context) {
    return <Widget>[
      PopupMenuButton<int>(
        onSelected: (value) {
          if (value == 0) {
            _auth.signOut();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AuthPage()),
            );
          }
        },
        child: Container(
            margin: const EdgeInsets.only(right: 16, left: 16, top: 4),
            child: Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 32,
            )),
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 1,
            child: ListTile(
              leading: GoogleUserCircleAvatar(
                identity: new Identity.fromFirebaseUser(user),
              ),
              title: Text(user.displayName ?? ''),
              subtitle: Text(user.email ?? ''),
            ),
          ),
          PopupMenuItem(
            value: 0,
            child: Center(
              child: Text("Logout"),
            ),
          ),
        ],
      )
    ];
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}
