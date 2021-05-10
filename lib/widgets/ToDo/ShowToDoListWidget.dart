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
  final ToDoList toDoList;

  ShowToDoListWidget({Key? key, required this.toDoList}) : super(key: key);

  @override
  _ShowToDoListWidgetState createState() => _ShowToDoListWidgetState();
}

class _ShowToDoListWidgetState extends State<ShowToDoListWidget> {
  late HomeState homeState;

  @override
  Widget build(BuildContext context) {
    homeState = Provider.of<HomeState>(context);
    return Container(
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
                            builder: (context) => AddToDoWidget(
                                eventId: homeState.event!.id!,
                                todoListId: widget.toDoList.id),
                            enableDrag: true)
                        .then((value) {
                      setState(() {});
                    });
                  })
            ],
          ),
          SizedBox(height: 24),
          Container(height: 300, child: toDoList())
        ],
      ),
    );
  }

  Widget toDoList() {
    return FutureBuilder<List<ToDo>>(
        future: ToDoDao.getTodos(homeState.event!.id!, widget.toDoList.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data!.length == 0) {
              return Center(
                child: Text("Поки що у вас немає Справ"),
              );
            }

            return ListView(
              padding: EdgeInsets.only(top: 8),
              children: snapshot.data!
                  .map(
                    (ToDo item) => todoItem(item),
                  )
                  .toList(),
            );
          } else {
            return Container();
          }
        });
  }

  Widget todoItem(ToDo item) {
    return GestureDetector(
      onLongPress: () {
        deleteConfirmation(context, item);
      },
      child: CheckboxListTile(
        title: Text(item.name),
        value: item.done,
        onChanged: (bool? val) {
          ToDoDao.todoDone(homeState.event!.id!, widget.toDoList.id, item.id!, val!)
              .then((value) {
            setState(() {});
          });
        },
      ),
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
                    ToDoDao.deleteTodo(
                        homeState.event!.id!, widget.toDoList.id, todo.id!);
                    setState(() {});
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }
}
