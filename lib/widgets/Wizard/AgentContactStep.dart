import 'package:flutter/material.dart';

import 'StepButton.dart';
import 'StepInfo.dart';

class AgentContactStep extends StatelessWidget {
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
                    "Твоя контактна інформація. Додай свій номер телефону, посилання на сайт, соціальні мережі тощо."),
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
