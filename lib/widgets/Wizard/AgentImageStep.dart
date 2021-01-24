import 'package:flutter/material.dart';

import 'StepButton.dart';
import 'StepInfo.dart';

class AgentImageStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            StepInfo(
                title: "Розкажи нам більше про свою роботу!",
                subtitle: "Останній крок - добав фото до свого профілю."),
          ],
        ),
         SizedBox(height: 48),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          StepButton(text: "Назад", next: false),
          StepButton(text: "Готово"),
        ])
      ],
    );
  }
}
