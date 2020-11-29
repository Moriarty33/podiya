import 'package:flutter/material.dart';

import 'StepButton.dart';
import 'StepInfo.dart';

class AgentGeneralInfoStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            StepInfo(
                title: "Розкажи нам більше про свою роботу!",
                subtitle:
                    "Заповни інформацію про себе, додай короткий опис, обери міста в яких ти працюєш та вкажи прайс за свої послуги."),
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
