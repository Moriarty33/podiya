import 'package:podiya/model/Event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EventDao {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static final path = "events";
  static final User user = FirebaseAuth.instance.currentUser!;

  static Future<String> saveEvent(Event event) {
    event.userId = user.uid;
    return firestore
        .collection(path)
        .add(event.toJson())
        .then((value) => value.id);
  }

  static Future<Event> getEvent(id) {
    return firestore.collection(path).doc(id).get().then((value) {
      Event event = Event.fromJson(value.data()!);
      event.id = value.id;
      return event;
    });
  }

  static Future<List<Event>> getEvents() {
    return firestore
        .collection(path)
        .where("userId", isEqualTo: user.uid)
        .get()
        .then((value) {
      return value.docs
          .map((element) => Event.fromJson(element.data()))
          .toList();
    });
  }
}
