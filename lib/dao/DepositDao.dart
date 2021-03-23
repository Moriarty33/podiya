import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:podiya/model/Deposit.dart';
import 'package:podiya/model/DepositSum.dart';

class DepositDao {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static final path = "deposits";

  static Future<DepositSum> depositSum(String eventId) {
    return DepositDao.getDeposits(eventId).then((list) {
      int uah = list
          .where((element) => element.currency == Currency.uah)
          .map((e) => e.amount)
          .fold(0, (a, b) => a + b);
      int usd = list
          .where((element) => element.currency == Currency.usd)
          .map((e) => e.amount)
          .fold(0, (a, b) => a + b);

      return DepositSum(uah: uah, usd: usd);
    });
  }

  static Future<List<Deposit>> getDeposits(String eventId) {
    return firestore
        .collection(path)
        .where("eventId", isEqualTo: eventId)
        .get()
        .then((value) => value.docs.map((element) {
              Deposit deposit = Deposit.fromJson(element.data());
              deposit.id = element.id;
              return deposit;
            }).toList());
  }

  static saveDeposit(Deposit deposit) {
    return firestore.collection(path).add(deposit.toJson());
  }

  static removeDeposit(String depositId) {
    return firestore.collection(path).doc(depositId).delete();
  }
}
