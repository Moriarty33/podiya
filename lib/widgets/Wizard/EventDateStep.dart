import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podiya/state/wizardState.dart';
import 'package:provider/provider.dart';

import 'StepButton.dart';
import 'StepInfo.dart';

class EventDateStep extends StatelessWidget {
  DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    WizardState wizardState = Provider.of<WizardState>(context);
    this.dateTime = wizardState.eventDate ?? DateTime.now();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            StepInfo(
                title: "Розкажи нам більше про свою Подію :) ",
                subtitle: "Коли має відбутись подія?"),
            SizedBox(height: 48),
            Container(
              height: 200,
              child: CupertinoDatePicker(
                  minimumDate: this.dateTime,
                  initialDateTime: this.dateTime,
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (DateTime newDateTime) {
                    this.dateTime = newDateTime;
                  }),
            )
          ],
        ),
         SizedBox(height: 48),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          StepButton(text: "Назад", next: false),
          StepButton(
              text: "Далі",
              next: true,
              cb: () {
                wizardState.setDate(this.dateTime);
              }),
        ])
      ],
    );
  }
}
