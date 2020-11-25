import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:podiya/model/UserData.dart';

class UserDataDao {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static final path = "usersData";

  static Future<UserData> getData() {
    User user = FirebaseAuth.instance.currentUser;
    return firestore
        .collection(path)
        .doc(user.uid)
        .get()
        .then((value) => UserData.fromJson(value.data()));
  }

  static createData(UserData data) {
    User user = FirebaseAuth.instance.currentUser;
    return firestore.collection(path).doc(user.uid).set(data.toJson());
  }
}
