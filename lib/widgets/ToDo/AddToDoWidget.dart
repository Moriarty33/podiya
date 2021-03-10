import 'package:flutter/material.dart';
import 'package:podiya/model/ToDo.dart';

import '../../theme.dart';

class AddToDoWidget extends StatefulWidget {
  final Function(ToDo) cb;

  const AddToDoWidget({Key key, this.cb}) : super(key: key);

  @override
  _AddToDoWidgetState createState() => _AddToDoWidgetState();
}

class _AddToDoWidgetState extends State<AddToDoWidget> {
  final _formKey = GlobalKey<FormState>();
  final field = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: EdgeInsets.only(top: 24, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Назва Справи", style: HeaderStyle),
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
              decoration: InputDecoration(hintText: 'Назва Справи'),
              controller: field,
              validator: (value) {
                if (value.trim().isEmpty) {
                  return 'Будь ласка введіть назву';
                }
                return null;
              },
            ),
            SizedBox(height: 36),
            Center(
                child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.all(16))),
              child: Text("Додати"),
              onPressed: () {
                _add(context);
              },
            ))
          ])),
    );
  }

  void _add(BuildContext context) {
    if (_formKey.currentState.validate()) {
      widget.cb(ToDo(name: field.value.text.trim(), done: false));
      Navigator.pop(context);
    }
  }
}
