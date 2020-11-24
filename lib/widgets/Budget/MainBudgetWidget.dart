import 'package:flutter/material.dart';

import '../../theme.dart';

class MainBudgetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        Text("Плануй свій бюджет", style: HeaderStyle),
      ]),
      SizedBox(height: 24),
      budgetItem(
          "Загальна сума", "Введи основну суму, яку ти плануєш витратити", 0),
      SizedBox(height: 16),
      budgetItem(
          "Завдатки",
          "Вводь сюди усі завдатки, які передаватимеш підрядникам, щоб нічого не забути !",
          50)
    ]);
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
              Text(sum.toString() + "\$",
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
