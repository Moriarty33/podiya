import 'package:json_annotation/json_annotation.dart';
import 'package:podiya/model/ToDoList.dart';

part 'Event.g.dart';

@JsonSerializable(explicitToJson: true)
class Event {
  String? id;
  String name;
  DateTime date;
  int city;
  List<String>? types = [];
  List<ToDoList>? toDoList = [];

  String? userId;

  Event({
    required this.name,
    required this.date,
    required this.city,
    required this.types,
    this.userId,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}
