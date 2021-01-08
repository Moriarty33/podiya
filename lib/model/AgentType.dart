import 'package:json_annotation/json_annotation.dart';

part 'AgentType.g.dart';

@JsonSerializable()
class AgentType {
  int id;
  String name;

  AgentType({this.id, this.name});

  factory AgentType.fromJson(Map<String, dynamic> json) =>
      _$AgentTypeFromJson(json);
  Map<String, dynamic> toJson() => _$AgentTypeToJson(this);
}
