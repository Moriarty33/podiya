import 'package:flutter/material.dart';
import 'package:podiya/widgets/Wizard/StepButton.dart';

import 'StepInfo.dart';

class EventNameStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            StepInfo(
                title: "Розкажи нам більше про свою Подію :) ",
                subtitle:
                    "Вкажи, яку подію ти збираєшся організувати: весілля, день народження, корпоратив чи щось інше."),
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          StepButton(text: "Назад", next: false),
          StepButton(text: "Далі"),
        ])
      ],
    );
  }
}
