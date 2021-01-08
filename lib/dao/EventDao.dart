import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:podiya/model/Event.dart';

class EventDao {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static final path = "events";
  static final User user = FirebaseAuth.instance.currentUser;

  static saveEvent(Event event) {
    event.userId = user.uid;
    return firestore.collection(path).add(event.toJson());
  }

  static getEvents() {
    return firestore.collection(path).where("userId", isEqualTo: user.uid);
  }
}
