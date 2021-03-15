import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:podiya/dao/DepositDao.dart';
import 'package:podiya/widgets/Budget/AddDepositWidget.dart';

import '../../theme.dart';

class ShowDepositWidget extends StatefulWidget {
  final String eventId;

  const ShowDepositWidget({Key key, this.eventId}) : super(key: key);

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
                        builder: (context) => AddDepositWidget(),
                        enableDrag: true);
                  },
                )
              ],
            ),
            SizedBox(height: 24),
            Container(height: 300, child: depositList())
          ],
        ));
  }

  depositList() {
    return FutureBuilder(
        future: DepositDao.getDeposits(widget.eventId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(
                scrollDirection: Axis.horizontal,
                children: snapshot.data.map((data) => deposit(data)));
          } else {
            return Container();
          }
        });
  }

  deposit(data) {
    return Container();
  }
}
