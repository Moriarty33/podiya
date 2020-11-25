import 'package:json_annotation/json_annotation.dart';

part 'UserData.g.dart';

enum UserType { user, agent }

@JsonSerializable()
class UserData {
  final UserType type;

  UserData({this.type});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
