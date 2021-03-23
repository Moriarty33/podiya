import 'package:json_annotation/json_annotation.dart';

part 'Deposit.g.dart';

enum Currency { usd, uah }

@JsonSerializable()
class Deposit {
  factory Deposit.fromJson(Map<String, dynamic> json) =>
      _$DepositFromJson(json);
  Map<String, dynamic> toJson() => _$DepositToJson(this);

  String id;

  Deposit(
      {this.eventId,
      this.currency,
      this.amount,
      this.category,
      this.description});

  String eventId;
  Currency currency;
  int amount;
  String category;
  String description;

  currencyChar() {
    return this.currency == Currency.usd ? " \$" : " ₴";
  }

  formatMoney() {
    return this.amount.toString() + this.currencyChar();
  }
}
