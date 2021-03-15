import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';

import '../../theme.dart';

class AddDepositWidget extends StatefulWidget {
  @override
  _AddDepositWidget createState() => _AddDepositWidget();
}

class _AddDepositWidget extends State<AddDepositWidget> {
  final _formKey = GlobalKey<FormState>();
  final field = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 600,
        padding: EdgeInsets.only(top: 24, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Додати Завдаток", style: HeaderStyle),
            SizedBox(height: 24),
            Container(height: 300, child: form())
          ],
        ));
  }

  Widget form() {
    int value = 2;
    List<S2Choice<int>> options = [
      S2Choice<int>(value: 1, title: 'Ionic'),
      S2Choice<int>(value: 2, title: 'Flutter'),
      S2Choice<int>(value: 3, title: 'React Native'),
    ];
    return Container(
      child: Form(
          key: _formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SmartSelect<int>.single(
              title: 'Категорія',
              modalType: S2ModalType.bottomSheet,
              tileBuilder: (context, state) {
                return S2Tile(
                  title: state.titleWidget,
                  value: state.valueDisplay,
                  onTap: state.showModal,
                  padding: EdgeInsets.all(0),
                );
              },
              value: value,
              choiceItems: options,
              onChange: (state) => setState(() => value = state.value),
            ),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(hintText: 'Опис Завдатку'),
              controller: field,
              validator: (value) {
                if (value.trim().isEmpty) {
                  return 'Будь ласка введіть опис';
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
              child: Text("Створити"),
              onPressed: () {
                _add(context);
              },
            ))
          ])),
    );
  }

  void _add(BuildContext context) {
    if (_formKey.currentState.validate()) {
      Navigator.pop(context);
    }
  }
}
