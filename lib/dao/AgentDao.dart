import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:podiya/model/Agent.dart';

class AgentDao {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static final path = "agents";
  static final User user = FirebaseAuth.instance.currentUser!;

  static saveAgent(Agent agent) {
    agent.userId = user.uid;
    return firestore.collection(path).add(agent.toJson());
  }

  static getAgents(String agentType) {
    return firestore
        .collection(path)
        .where(FieldPath.fromString("types"), arrayContains: agentType)
        .get()
        .then((value) {
      return value.docs
          .map((element){
           Agent agent =  Agent.fromJson(element.data());
           agent.id = element.id;
           return agent;
          })
          .toList();
    });
  }

  static getAgent(String id) {
    return firestore
        .collection(path)
        .doc(id)
        .get()
        .then((value) {
          return Agent.fromJson(value.data()!);
    });
  }
}
