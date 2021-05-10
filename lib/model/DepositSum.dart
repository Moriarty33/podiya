import 'package:json_annotation/json_annotation.dart';

part 'DepositSum.g.dart';

@JsonSerializable()
class DepositSum {
  factory DepositSum.fromJson(Map<String, dynamic> json) =>
      _$DepositSumFromJson(json);
  Map<String, dynamic> toJson(instance) => _$DepositSumToJson(this);

  int uah;
  int usd;

  DepositSum({required this.uah, required this.usd});
}
