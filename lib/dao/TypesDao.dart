import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:podiya/model/AgentType.dart';

class TypesDao {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static final path = "types";

  static Future<List<AgentType>> getAgentTypes() {
    return firestore.collection(path).doc("agents").get().then((value) {
      List<AgentType> agentList = new List();
      List.castFrom(value['types'])
          .forEach((element) => agentList.add(AgentType.fromJson(element)));
      return agentList;
    });
  }
}
