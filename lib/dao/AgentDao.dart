import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:podiya/model/Agent.dart';

class AgentDao {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static final path = "agents";
  static final User user = FirebaseAuth.instance.currentUser;

  static saveAgent(Agent agent) {
    agent.userId = user.uid;
    return firestore.collection(path).add(agent.toJson());
  }
}
