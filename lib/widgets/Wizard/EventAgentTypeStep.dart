import 'package:flutter/material.dart';

import 'StepButton.dart';
import 'StepInfo.dart';

class EventAgentTypeStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            StepInfo(
                title: "Розкажи нам більше про свою Подію :) ",
                subtitle: "Обери підрядників яких шукаєш на свою подію."),
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          StepButton(text: "Назад", next: false),
          StepButton(text: "Готово"),
        ])
      ],
    );
  }
}
