import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:podiya/model/ToDo.dart';
import 'package:podiya/model/ToDoList.dart';

class ToDoDao {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static final path = "todoLists";

  static buildPath(String eventId) {
    return "events/$eventId/${path}";
  }

  static createList(String eventId, ToDoList todoList) {
    return firestore.collection(buildPath(eventId)).add(todoList.toJson());
  }

  static Future<List<ToDoList>> getLists(String eventId) {
    return firestore
        .collection(buildPath(eventId))
        .get()
        .then((value) => value.docs.map((element) {
              ToDoList toDoList = ToDoList.fromJson(element.data());
              toDoList.id = element.id;
              return toDoList;
            }).toList());
  }

  static getTodos(String eventId, String todoListId) {
    return firestore
        .collection("${buildPath(eventId)}/${todoListId}/todos")
        .get()
        .then((value) => value.docs.map((element) {
              ToDo toDos = ToDo.fromJson(element.data());
              toDos.id = element.id;
              return toDos;
            }).toList());
  }

  static deleteList(String eventId, String todoListId) {
    return firestore.collection(buildPath(eventId)).doc(todoListId).delete();
  }

  static addTodo(String eventId, String todoListId, ToDo todo) {
    return firestore
        .collection('${buildPath(eventId)}/${todoListId}/todos')
        .add(todo.toJson());
  }

  static deleteTodo(String eventId, String todoListId, String todoId) {
    return firestore
        .collection('${buildPath(eventId)}/$todoListId/todos')
        .doc(todoId)
        .delete();
  }

  static todoDone(String eventId, String todoListId, String todoId, bool done) {
    return firestore
        .collection('${buildPath(eventId)}/$todoListId/todos')
        .doc(todoId)
        .update({"done": done});
  }
}
