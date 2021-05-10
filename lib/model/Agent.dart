import 'package:json_annotation/json_annotation.dart';
import 'package:podiya/data/cities.dart';
import 'AgentLinks.dart';

part 'Agent.g.dart';

@JsonSerializable(explicitToJson: true)
class Agent {
  String id = "";
  String firstname;
  String lastname;
  String description;
  String phoneNumber;
  String image;
  String userId = "";

  double amount;

  AgentLinks links;

  List<String> images;
  List<int> cities;
  List<String> types;

  Agent({
    required this.firstname,
    required this.lastname,
    required this.description,
    required this.phoneNumber,
    required this.image,
    required this.amount,
    required this.images,
    required this.cities,
    required this.types,
    required this.links,
  });

  factory Agent.fromJson(Map<String, dynamic> json) => _$AgentFromJson(json);
  Map<String, dynamic> toJson() => _$AgentToJson(this);

  formatMoney() {
    return this.amount.toString() + " ₴";
  }

  formatCities() {
    return this.cities.map((e) => findCityById(e)["name"]);
  }
}
