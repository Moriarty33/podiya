import 'package:json_annotation/json_annotation.dart';

import 'package:podiya/model/ToDo.dart';

part 'ToDoList.g.dart';

@JsonSerializable(explicitToJson: true)
class ToDoList {
  String eventId;
  String name;
  int icon;
  List<ToDo> todos;

  ToDoList({
    this.eventId,
    this.name,
    this.icon,
    this.todos,
  });

  factory ToDoList.fromJson(Map<String, dynamic> json) =>
      _$ToDoListFromJson(json);
  Map<String, dynamic> toJson() => _$ToDoListToJson(this);
}
