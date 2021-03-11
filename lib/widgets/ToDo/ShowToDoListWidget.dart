import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:podiya/dao/ToDoDao.dart';
import 'package:podiya/model/ToDo.dart';
import 'package:podiya/model/ToDoList.dart';
import 'package:podiya/state/homeState.dart';
import 'package:podiya/widgets/ToDo/AddToDoWidget.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class ShowToDoListWidget extends StatefulWidget {
  final Function() cb;
  final ToDoList toDoList;

  ShowToDoListWidget({Key key, this.cb, this.toDoList}) : super(key: key);

  @override
  _ShowToDoListWidgetState createState() => _ShowToDoListWidgetState();
}

class _ShowToDoListWidgetState extends State<ShowToDoListWidget> {
  HomeState homeState;
  List<ToDo> todos;

  @override
  Widget build(BuildContext context) {
    todos = widget.toDoList.todos;
    homeState = Provider.of<HomeState>(context);
    return WillPopScope(
      onWillPop: () async {
        await ToDoDao.saveTodos(widget.toDoList.id, todos);
        widget.cb();
        return true;
      },
      child: Container(
        height: 600,
        padding: EdgeInsets.only(top: 24, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.toDoList.name, style: HeaderStyle),
                IconButton(
                    icon: Icon(Icons.add_circle, size: 36),
                    onPressed: () {
                      showMaterialModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          context: context,
                          builder: (context) => AddToDoWidget(cb: (ToDo todo) {
                                setState(() {
                                  todos.add(todo);
                                });
                              }),
                          enableDrag: true);
                    })
              ],
            ),
            SizedBox(height: 24),
            Container(height: 300, child: toDoList(todos))
          ],
        ),
      ),
    );
  }

  Widget toDoList(List<ToDo> todos) {
    if (todos.length == 0) {
      return Center(
        child: Text("Поки що у вас немає Справ"),
      );
    }
    return ListView(
      padding: EdgeInsets.only(top: 8),
      children: todos
          .map(
            (ToDo item) => GestureDetector(
              onLongPress: () {
                deleteConfirmation(context, item);
              },
              child: CheckboxListTile(
                title: Text(item.name),
                value: item.done,
                onChanged: (bool val) {
                  setState(() => item.done = val);
                },
              ),
            ),
          )
          .toList(),
    );
  }

  deleteConfirmation(BuildContext context, ToDo todo) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Підтвердження"),
              content: Text("Ви впевнені що точно хочете видалити цю справу?"),
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
                    setState(() {
                      todos.remove(todo);
                    });
                  },
                )
              ],
            ));
  }
}
