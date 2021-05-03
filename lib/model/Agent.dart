import 'package:json_annotation/json_annotation.dart';

import 'AgentLinks.dart';

part 'Agent.g.dart';

@JsonSerializable(explicitToJson: true)
class Agent {
  String id;
  String firstname;
  String lastname;
  String description;
  String phoneNumber;
  String image;
  String userId;

  double amount;

  AgentLinks links;

  List<String> images;
  List<int> cities;
  List<String> types;

  Agent({
    this.firstname,
    this.lastname,
    this.description,
    this.phoneNumber,
    this.image,
    this.amount,
    this.images,
    this.cities,
    this.types,
    this.links,
  });

  factory Agent.fromJson(Map<String, dynamic> json) => _$AgentFromJson(json);
  Map<String, dynamic> toJson() => _$AgentToJson(this);
}
