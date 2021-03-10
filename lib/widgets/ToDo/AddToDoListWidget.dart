import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:podiya/dao/ToDoDao.dart';
import 'package:podiya/model/ToDoList.dart';
import 'package:podiya/state/homeState.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class AddToDoListWidget extends StatefulWidget {
  final Function() cb;

  const AddToDoListWidget({Key key, this.cb}) : super(key: key);

  @override
  _AddToDoListWidgetState createState() => _AddToDoListWidgetState();
}

class _AddToDoListWidgetState extends State<AddToDoListWidget> {
  final _formKey = GlobalKey<FormState>();
  final field = TextEditingController();

  IconData _icon = Icons.home;
  HomeState homeState;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    homeState = Provider.of<HomeState>(context);
    return Container(
      height: 600,
      padding: EdgeInsets.only(top: 24, left: 16, right: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50))),
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
                onPressed: loading == true ? null : () => _create(context),
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

  _create(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      setState(() {
        loading = true;
      });
      await ToDoDao.createList(ToDoList(
          eventId: homeState.event.id,
          icon: _icon.codePoint.toString(),
          name: field.value.text,
          todos: []));
      widget.cb();
      Navigator.pop(context);
      setState(() {
        loading = false;
      });
    }
  }
}
