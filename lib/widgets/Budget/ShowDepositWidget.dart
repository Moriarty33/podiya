import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:podiya/dao/DepositDao.dart';
import 'package:podiya/model/Deposit.dart';
import 'package:podiya/widgets/Budget/AddDepositWidget.dart';

import '../../theme.dart';

class ShowDepositWidget extends StatefulWidget {
  final String eventId;

  const ShowDepositWidget({Key? key, required this.eventId})
      : super(key: key);

  @override
  _ShowDepositWidgetState createState() => _ShowDepositWidgetState();
}

class _ShowDepositWidgetState extends State<ShowDepositWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 700,
        padding: EdgeInsets.only(top: 24, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Завдатки", style: HeaderStyle),
                IconButton(
                  icon: Icon(Icons.add_circle, size: 36),
                  onPressed: () {
                    showMaterialModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            context: context,
                            builder: (context) =>
                                AddDepositWidget(eventId: widget.eventId),
                            enableDrag: true)
                        .then((value) {
                      setState(() {});
                    });
                  },
                )
              ],
            ),
            SizedBox(height: 24),
            Container(
                height: 500, padding: EdgeInsets.zero, child: depositList())
          ],
        ));
  }

  depositList() {
    return FutureBuilder<List<Deposit>>(
        future: DepositDao.getDeposits(widget.eventId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data!.length == 0) {
              return Center(
                child: Text("Поки що у вас немає Завдатків"),
              );
            }

            return ListView(
                padding: EdgeInsets.all(0),
                children: snapshot.data!
                    .map((data) => deposit(context, data))
                    .toList());
          } else {
            return Container();
          }
        });
  }

  Widget deposit(BuildContext context, Deposit deposit) {
    return GestureDetector(
      onLongPress: () {
        deleteDepositConfirmation(context, deposit);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.black12),
        margin: EdgeInsets.only(top: 8, bottom: 8),
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Категорія"), Text(deposit.category)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Опис"), Text(deposit.description)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Сума"), Text(deposit.formatMoney())],
            )
          ],
        ),
      ),
    );
  }

  deleteDepositConfirmation(BuildContext context, Deposit deposit) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Підтвердження"),
              content:
                  Text("Ви впевнені що точно хочете видалити цей завдаток?"),
              actions: [
                TextButton(
                  child: Text("Скасувати"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text("Видалити"),
                  onPressed: () async {
                    Navigator.of(context).pop();
                    await DepositDao.removeDeposit(deposit.id);
                    setState(() {});
                  },
                )
              ],
            ));
  }
}
