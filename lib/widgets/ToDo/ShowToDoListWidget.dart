import 'package:flutter/material.dart';
import 'package:podiya/model/ToDoList.dart';
import 'package:podiya/state/homeState.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class ShowToDoListWidget extends StatefulWidget {
  final Function() cb;
  final ToDoList toDoList;

  const ShowToDoListWidget({Key key, this.cb, this.toDoList}) : super(key: key);

  @override
  _fileState createState() => _fileState();
}

class _fileState extends State<ShowToDoListWidget> {
  HomeState homeState;

  @override
  Widget build(BuildContext context) {
    homeState = Provider.of<HomeState>(context);
    return Container(
      height: 600,
      padding: EdgeInsets.only(top: 24, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.toDoList.name, style: HeaderStyle),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}
