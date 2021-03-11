import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:podiya/dao/ToDoDao.dart';
import 'package:podiya/model/ToDoList.dart';
import 'package:podiya/state/homeState.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';
import 'AddToDoListWidget.dart';
import 'ShowToDoListWidget.dart';

class MainToDoWidget extends StatefulWidget {
  @override
  _MainToDoWidgetState createState() => _MainToDoWidgetState();
}

class _MainToDoWidgetState extends State<MainToDoWidget> {
  @override
  Widget build(BuildContext context) {
    HomeState homeState = Provider.of<HomeState>(context);
    return Column(children: [
      Row(children: [
        Text("Список Справ", style: HeaderStyle),
      ]),
      Container(
          height: 72,
          margin: EdgeInsets.only(top: 16),
          child: FutureBuilder(
              future: ToDoDao.getLists(homeState.event.id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  List<Widget> widgets = [createTodo(context)];
                  snapshot.data.forEach(
                      (ToDoList todoList) => widgets.add(todo(todoList)));

                  return ListView(
                      scrollDirection: Axis.horizontal, children: widgets);
                } else {
                  return Container();
                }
              }))
    ]);
  }

  Widget createTodo(context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            showMaterialModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                context: context,
                builder: (context) => AddToDoListWidget(cb: () {
                      setState(() {});
                    }),
                enableDrag: true);
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

  Widget todo(ToDoList toDoList) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      child: Column(
        children: [
          GestureDetector(
            onTap: () async {
              showMaterialModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  context: context,
                  builder: (context) => ShowToDoListWidget(
                      toDoList: toDoList,
                      cb: () {
                        setState(() {});
                      }),
                  enableDrag: true);
            },
            onLongPress: () {
              deleteToDoConfirmation(context, toDoList);
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.black38,
              ),
              height: 56,
              width: 56,
              child: Container(
                  color: Colors.transparent,
                  child: Icon(
                      IconData(int.parse(toDoList.icon),
                          fontFamily: 'MaterialIcons'),
                      color: Colors.white70)),
            ),
          ),
          Text(
            calculatePercents(toDoList).toString() + "%",
            style: TextStyle(color: Colors.black54, fontSize: 10),
          )
        ],
      ),
    );
  }

  int calculatePercents(ToDoList toDoList) {
    int all = toDoList.todos.length;
    int done = toDoList.todos.where((element) => element.done == true).length;

    if (done == 0 || all == 0) {
      return 0;
    }

    return (done / all * 100).round();
  }

  deleteToDoConfirmation(BuildContext context, ToDoList toDoList) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Підтвердження"),
              content:
                  Text("Ви впевнені що точно хочете видалити список справ?"),
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
                    await ToDoDao.deleteList(toDoList.id);
                    setState(() {});
                  },
                )
              ],
            ));
  }
}
