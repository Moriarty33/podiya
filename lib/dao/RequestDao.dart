import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:podiya/model/Request.dart';

class AgentDao {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static final path = "requests";

  static createRequest(Request request) {
    return firestore.collection(path).add(request.toJson());
  }
}
