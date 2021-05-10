import 'package:flutter/material.dart';
import 'package:podiya/dao/DepositDao.dart';
import 'package:podiya/dao/TypesDao.dart';
import 'package:podiya/model/AgentType.dart';
import 'package:podiya/model/Deposit.dart';
import 'package:smart_select/smart_select.dart';

import '../../theme.dart';

class AddDepositWidget extends StatefulWidget {
  final String eventId;

  AddDepositWidget({required this.eventId});

  @override
  _AddDepositWidget createState() => _AddDepositWidget();
}

class _AddDepositWidget extends State<AddDepositWidget> {
  final _formKey = GlobalKey<FormState>();
  final field = TextEditingController();
  final sumField = TextEditingController();
  bool loading = true;
  S2Choice<int> category = S2Choice<int>(value: 0, title: '');
  S2Choice<int> currency =
      S2Choice<int>(value: 1, title: 'Долар \$', meta: Currency.usd);
  List<S2Choice<int>> categories = [];
  List<S2Choice<int>> currencies = [
    S2Choice<int>(value: 1, title: 'Долар \$', meta: Currency.usd),
    S2Choice<int>(value: 2, title: 'Гривня \₴', meta: Currency.uah),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future(() async {
      List<AgentType> types = await TypesDao.getAgentTypes();
      List<S2Choice<int>> optionsForSelect = types
          .map((e) => S2Choice<int>(
              value: types.indexOf(e), title: e.name, meta: e.name))
          .toList();
      setState(() {
        category = optionsForSelect.first;
        categories = optionsForSelect;
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 680,
        padding: EdgeInsets.only(top: 24, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Додати Завдаток", style: HeaderStyle),
            SizedBox(height: 24),
            Container(child: form())
          ],
        ));
  }

  Widget form() {
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
                  loadingText: "Завантаження..",
                  isLoading: loading,
                  padding: EdgeInsets.all(0),
                );
              },
              value: category.value,
              choiceItems: categories,
              onChange: (state) => setState(() {
                category = categories
                    .firstWhere((element) => element.value == state.value);
              }),
            ),
            SmartSelect<int>.single(
              title: 'Валюта',
              modalType: S2ModalType.bottomSheet,
              tileBuilder: (context, state) {
                return S2Tile(
                  title: state.titleWidget,
                  value: state.valueDisplay,
                  onTap: state.showModal,
                  padding: EdgeInsets.all(0),
                );
              },
              value: currency.value,
              choiceItems: currencies,
              onChange: (state) => setState(() {
                currency = currencies
                    .firstWhere((element) => element.value == state.value);
              }),
            ),
            SizedBox(height: 8),
            TextFormField(
                decoration: InputDecoration(hintText: 'Опис Завдатку'),
                controller: field),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(hintText: 'Сума Завдатку'),
              controller: sumField,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.trim().isEmpty) {
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

  void _add(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      await DepositDao.saveDeposit(Deposit(
          amount: int.parse(sumField.value.text),
          category: category.meta,
          currency:
              Currency.values.firstWhere((element) => element == currency.meta),
          description: field.value.text,
          eventId: widget.eventId));
      Navigator.pop(context);
    }
  }
}
