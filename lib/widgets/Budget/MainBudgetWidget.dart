import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:podiya/dao/DepositDao.dart';
import 'package:podiya/model/DepositSum.dart';
import 'package:podiya/state/homeState.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';
import 'ShowDepositWidget.dart';

class MainBudgetWidget extends StatefulWidget {
  @override
  _MainBudgetWidgetState createState() => _MainBudgetWidgetState();
}

class _MainBudgetWidgetState extends State<MainBudgetWidget> {
  late HomeState homeState;

  @override
  Widget build(BuildContext context) {
    homeState = Provider.of<HomeState>(context);
    return Column(children: [
      Row(children: [
        Text("Плануй свій бюджет", style: HeaderStyle),
      ]),
      SizedBox(height: 24),
      FutureBuilder(
          future: DepositDao.depositSum(homeState.event!.id!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              DepositSum depositSum = snapshot.data as DepositSum;
              return GestureDetector(
                onTap: () {
                  this.openDeposit(context);
                },
                child: budgetItem(
                    "Завдатки",
                    "Вводь сюди усі завдатки, які передаватимеш підрядникам, щоб нічого не забути !",
                    depositSum.usd.toString() +
                        "\$ / " +
                        depositSum.uah.toString() +
                        "₴"),
              );
            } else {
              return GestureDetector(
                onTap: () {
                  this.openDeposit(context);
                },
                child: budgetItem(
                    "Завдатки",
                    "Вводь сюди усі завдатки, які передаватимеш підрядникам, щоб нічого не забути !",
                    "-"),
              );
            }
          })
    ]);
  }

  openDeposit(BuildContext context) {
    showMaterialModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            context: context,
            builder: (context) =>
                ShowDepositWidget(eventId: homeState.event!.id!),
            enableDrag: true)
        .then((value) {
      setState(() {});
    });
  }

  Widget budgetItem(name, description, sum) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.black38),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(sum.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(color: Colors.black45),
          )
        ],
      ),
    );
  }
}
