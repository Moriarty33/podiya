import 'package:json_annotation/json_annotation.dart';

part 'Request.g.dart';

@JsonSerializable()
class Request {
  factory Request.fromJson(Map<String, dynamic> json) =>
      _$RequestFromJson(json);

  Map<String, dynamic> toJson() => _$RequestToJson(this);

  String fromUserId;
  String toAgentId;
  String eventId;

  // FieldValue createdAt = FieldValue.serverTimestamp();
  String comment;

  Request(
      {required this.fromUserId,
      required this.toAgentId,
      required this.eventId,
      required this.comment});
}
