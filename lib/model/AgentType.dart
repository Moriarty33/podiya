import 'package:json_annotation/json_annotation.dart';

part 'AgentType.g.dart';

@JsonSerializable()
class AgentType {
  String id;
  String name;

  AgentType({required  this.id, required this.name});

  factory AgentType.fromJson(Map<String, dynamic> json) =>
      _$AgentTypeFromJson(json);
  Map<String, dynamic> toJson() => _$AgentTypeToJson(this);
}
