import 'package:json_annotation/json_annotation.dart';

part 'ToDoList.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class ToDoList {
  String id;
  String name;
  String icon;

  ToDoList({
    this.name,
    this.icon,
  });

  factory ToDoList.fromJson(Map<String, dynamic> json) =>
      _$ToDoListFromJson(json);
  Map<String, dynamic> toJson() => _$ToDoListToJson(this);
}
