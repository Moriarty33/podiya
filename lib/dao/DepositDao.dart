import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:podiya/model/DepositSum.dart';

class DepositDao {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static final path = "deposits";

  static Future<DepositSum> depositSum(String eventId) {
    return Future.delayed(Duration(seconds: 1), () {
      return DepositSum(UAH: 12, USD: 33);
    });
  }

  static getDeposits(String eventId) {}
}
