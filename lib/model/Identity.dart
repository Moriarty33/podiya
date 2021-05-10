import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Identity extends GoogleIdentity {
  String id;
  String email;
  String displayName;
  String photoUrl;

  Identity(
      {required this.id,
      required this.email,
      required this.displayName,
      required this.photoUrl});

  factory Identity.fromFirebaseUser(User user) {
    return Identity(
        id: user.uid,
        email: user.email as String,
        displayName: user.displayName as String,
        photoUrl: user.photoURL as String);
  }
}
