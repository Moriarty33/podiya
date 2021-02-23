import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:podiya/dao/ToDoDao.dart';
import 'package:podiya/model/ToDoList.dart';
import 'package:podiya/state/homeState.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class AddToDoListWidget extends StatefulWidget {
  @override
  _AddToDoListWidgetState createState() => _AddToDoListWidgetState();
}

class _AddToDoListWidgetState extends State<AddToDoListWidget> {
  final _formKey = GlobalKey<FormState>();

  final field = TextEditingController();

  IconData _icon = Icons.home;
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
          Text("Створити новий список", style: HeaderStyle),
          SizedBox(height: 32),
          form()
        ],
      ),
    );
  }

  Widget form() {
    return Container(
      child: Form(
          key: _formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextFormField(
              decoration: InputDecoration(hintText: 'Назва списку'),
              controller: field,
              validator: (value) {
                if (value.trim().isEmpty) {
                  return 'Будь ласка введіть назву';
                }
                return null;
              },
            ),
            SizedBox(height: 24),
            Text("Значок ( натисніть щоб вибрати інший)"),
            SizedBox(height: 8),
            RaisedButton(
              color: Colors.white,
              padding:
                  EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 12),
              onPressed: _pickIcon,
              child: Icon(
                _icon,
                size: 24,
              ),
            ),
            SizedBox(height: 36),
            Center(
              child: RaisedButton(
                color: Colors.black,
                padding:
                    EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 12),
                onPressed: _create,
                child: Text(
                  "Створити",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            )
          ])),
    );
  }

  _pickIcon() async {
    IconData icon = await FlutterIconPicker.showIconPicker(context,
        iconPackMode: IconPack.material);

    setState(() {
      _icon = icon;
    });
  }

  _create() {
    ToDoDao.createList(ToDoList(
        eventId: homeState.event.id,
        icon: _icon.codePoint,
        name: field.value.text,
        todos: []
      ));
  }
}
