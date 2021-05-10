import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:podiya/dao/ToDoDao.dart';
import 'package:podiya/model/ToDo.dart';
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
  late HomeState homeState;
  @override
  Widget build(BuildContext context) {
    homeState = Provider.of<HomeState>(context);
    return Column(children: [
      Row(children: [
        Text("Список Справ", style: HeaderStyle),
      ]),
      Container(
          height: 72,
          margin: EdgeInsets.only(top: 16),
          child: FutureBuilder<List<ToDoList>>(
              future: ToDoDao.getLists(homeState.event!.id!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  List<Widget> widgets = [createTodo(context)];
                  snapshot.data!.forEach(
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
                      builder: (context) =>
                          ShowToDoListWidget(toDoList: toDoList),
                      enableDrag: true)
                  .then((value) {
                setState(() {});
              });
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
          calculatePercents(toDoList)
        ],
      ),
    );
  }

  Widget calculatePercents(ToDoList toDoList) {
    return Container(
      child: FutureBuilder<List<ToDo>>(
          future: ToDoDao.getTodos(homeState.event!.id!, toDoList.id),
          builder: (context, snapshot) {
            int value = 0;
            if (snapshot.connectionState == ConnectionState.done) {
              List<ToDo> todos = snapshot.data!;
              if (todos == null) {
                value = 0;
              }
              int all = todos.length;
              int done = todos.where((element) => element.done == true).length;

              if (done == 0 || all == 0) {
                value = 0;
              } else {
                value = (done / all * 100).round();
              }
            }

            return Text(value.toString() + "%",
                style: TextStyle(color: Colors.black54, fontSize: 10));
          }),
    );
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
                    await ToDoDao.deleteList(homeState.event!.id!, toDoList.id);
                    setState(() {});
                  },
                )
              ],
            ));
  }
}
