import 'package:flutter/material.dart';
import 'package:podiya/model/UserData.dart';
import 'package:podiya/state/wizardState.dart';
import 'package:provider/provider.dart';

import 'AgentTypeTags.dart';
import 'StepButton.dart';
import 'StepInfo.dart';

class EventAgentTypeStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title;
    String subtitle;
    String nextButton;
    WizardState wizardState = Provider.of<WizardState>(context);
    if (wizardState.type == UserType.agent) {
      title = "Розкажи нам більше про свою роботу!";
      subtitle = "Обери свою сферу діяльності.";
      nextButton = "Далі";
    } else {
      title = "Розкажи нам більше про свою Подію :)";
      subtitle = "Обери підрядників яких шукаєш на свою подію.";
      nextButton = "Готово";
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            StepInfo(title: title, subtitle: subtitle),
            SizedBox(height: 24),
            AgentTypeTags()
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          StepButton(text: "Назад", next: false),
          StepButton(text: nextButton),
        ])
      ],
    );
  }
}
