import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:podiya/state/wizardState.dart';
import 'package:provider/provider.dart';

import 'SelectImages.dart';
import 'StepButton.dart';
import 'StepInfo.dart';

class AgentImageStep extends StatelessWidget {
  WizardState wizardState;

  @override
  Widget build(BuildContext context) {
    wizardState = Provider.of<WizardState>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            StepInfo(
                title: "Розкажи нам більше про свою роботу!",
                subtitle:
                    "Останній крок - добав декілька фото до свого профілю а потім вибери головне."),
            SizedBox(height: 24),
            SelectImages(cbImage: (Asset image) {
              wizardState.setAgentImage(image);
            }, cbImages: (List<Asset> images) {
              wizardState.setAgentImages(images);
            })
          ],
        ),
        SizedBox(height: 48),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          StepButton(text: "Назад", next: false),
          StepButton(
              text: "Готово",
              cb: () {
                if (wizardState.agentImages.length == 0) {
                  showMessage(context, "Загрузіть фото для вашого профілю");
                  return;
                }
                if (wizardState.agentImage == null) {
                  showMessage(context, "Натисніть на фото щоб вибрати головне");
                  return;
                }

                wizardState.increment();
              }),
        ])
      ],
    );
  }

  showMessage(context, message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
