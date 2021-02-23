import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:podiya/model/ToDoList.dart';

class ToDoDao {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static final path = "todos";

  static createList(ToDoList todoList) {
    return firestore.collection(path).add(todoList.toJson());
  }
}
