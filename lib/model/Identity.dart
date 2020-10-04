import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Identity extends GoogleIdentity {
  String id;
  String email;
  String displayName;
  String photoUrl;

  Identity({this.id, this.email, this.displayName, this.photoUrl});

  factory Identity.fromFirebaseUser(User user) {
    return Identity(
        id: user.uid,
        email: user.email,
        displayName: user.displayName,
        photoUrl: user.photoURL);
  }
}
