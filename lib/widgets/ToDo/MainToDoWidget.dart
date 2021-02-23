import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../theme.dart';
import 'AddToDoListWidget.dart';

class MainToDoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        Text("Список Справ", style: HeaderStyle),
      ]),
      Container(
          height: 72,
          margin: EdgeInsets.only(top: 16),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              createTodo(context),
              todo(Icons.photo, 15),
              todo(Icons.phone, 25),
              todo(Icons.home, 32)
            ],
          ))
    ]);
  }

  Widget createTodo(context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            showMaterialModalBottomSheet(
              context: context,
              builder: (context) => AddToDoListWidget(),
              enableDrag: true,
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.black,
            ),
            height: 56,
            width: 56,
            child: Container(
                color: Colors.transparent,
                child: Icon(Icons.add, color: Colors.white)),
          ),
        ),
        Text("")
      ],
    );
  }

  Widget todo(icon, donePercent) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.black38,
            ),
            height: 56,
            width: 56,
            child: Container(
                color: Colors.transparent,
                child: Icon(icon, color: Colors.white70)),
          ),
          Text(
            donePercent.toString() + "%",
            style: TextStyle(color: Colors.black54, fontSize: 10),
          )
        ],
      ),
    );
  }
}
