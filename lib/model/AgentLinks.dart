import 'package:json_annotation/json_annotation.dart';

part 'AgentLinks.g.dart';

@JsonSerializable()
class AgentLinks {
  String? website;
  String? facebook;
  String? instagram;
  String? other;

  AgentLinks({
     this.website,
     this.facebook,
     this.instagram,
     this.other,
  });

  factory AgentLinks.fromJson(Map<String, dynamic> json) =>
      _$AgentLinksFromJson(json);
  Map<String, dynamic> toJson() => _$AgentLinksToJson(this);
}
