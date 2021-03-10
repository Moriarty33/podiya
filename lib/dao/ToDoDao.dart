import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:podiya/model/ToDo.dart';
import 'package:podiya/model/ToDoList.dart';

class ToDoDao {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static final path = "todos";

  static createList(ToDoList todoList) {
    return firestore.collection(path).add(todoList.toJson());
  }

  static getLists(String eventId) {
    return firestore
        .collection(path)
        .where("eventId", isEqualTo: eventId)
        .get()
        .then((value) => value.docs.map((element) {
              ToDoList toDoList = ToDoList.fromJson(element.data());
              toDoList.id = element.id;
              return toDoList;
            }).toList());
  }

  static saveTodos(String todoListId, List<ToDo> todos) {
    return firestore
        .collection(path)
        .doc(todoListId)
        .update({"todos": todos?.map((e) => e?.toJson())?.toList()});
  }
}
