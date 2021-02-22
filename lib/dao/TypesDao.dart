import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:podiya/model/AgentType.dart';

class TypesDao {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static final path = "agentTypes";

  static Future<List<AgentType>> getAgentTypes() {
    return firestore
        .collection(path)
        .get()
        .then((value) => value.docs.map((element) {
              Map<String, dynamic> data = element.data();
              data["id"] = element.id;
              return AgentType.fromJson(data);
            }).toList());
  }

  static Future<List<AgentType>> getAgentTypesByIds(List<String> agentIds) {
    return firestore
        .collection(path)
        .where(FieldPath.documentId, whereIn: agentIds)
        .get()
        .then((value) => value.docs.map((element) {
              Map<String, dynamic> data = element.data();
              data["id"] = element.id;
              return AgentType.fromJson(data);
            }).toList());
  }
}
