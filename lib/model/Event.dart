import 'package:json_annotation/json_annotation.dart';

part 'Event.g.dart';

@JsonSerializable()
class Event {
  String name;
  DateTime date;
  int city;
  List<int> types;
  
  String userId;

  Event({
    this.name,
    this.date,
    this.city,
    this.types,
    this.userId,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}
