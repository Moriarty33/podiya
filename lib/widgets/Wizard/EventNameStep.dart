import 'package:flutter/material.dart';
import 'package:podiya/state/wizardState.dart';
import 'package:podiya/widgets/Wizard/StepButton.dart';
import 'package:provider/provider.dart';

import 'StepInfo.dart';

class EventNameStep extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final field = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WizardState wizardState = Provider.of<WizardState>(context);
    field.text = wizardState.eventName;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(children: [
          StepInfo(
              title: "Розкажи нам більше про свою Подію :) ",
              subtitle:
                  "Вкажи, яку подію ти збираєшся організувати: весілля, день народження, корпоратив чи щось інше."),
          SizedBox(height: 48),
          Form(
              key: _formKey,
              child: Column(children: [
                TextFormField(
                  decoration: InputDecoration(
                        hintText: 'Напишу назву події яку б ти хотів бачити'),
                  controller: field,
                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return 'Будь ласка введіть назву';
                    }
                    return null;
                  },
                )
              ]))
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          StepButton(text: "Назад", next: false),
          StepButton(
              text: "Далі",
              next: true,
              cb: () {
                if (_formKey.currentState.validate()) {
                  wizardState.setName(field.text.trim());
                }
              }),
        ])
      ],
    );
  }
}
