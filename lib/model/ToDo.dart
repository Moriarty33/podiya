import 'package:json_annotation/json_annotation.dart';

part 'ToDo.g.dart';

@JsonSerializable()
class ToDo {
  String id;
  String name;
  bool done;

  ToDo({
    this.id,
    this.name,
    this.done,
  });

  factory ToDo.fromJson(Map<String, dynamic> json) => _$ToDoFromJson(json);
  Map<String, dynamic> toJson() => _$ToDoToJson(this);
}
