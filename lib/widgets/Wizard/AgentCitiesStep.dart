import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:podiya/data/cities.dart';
import 'package:podiya/state/wizardState.dart';
import 'package:provider/provider.dart';

import 'StepButton.dart';
import 'StepInfo.dart';

class AgentCitiesStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WizardState wizardState = Provider.of<WizardState>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            StepInfo(
                title: "Розкажи нам більше про свою роботу!",
                subtitle: "Вибери міста в яких ти можеш надавати послуги"),
            SizedBox(height: 48),
            MultiSelectBottomSheetField(
              confirmText: Text("Вибрати"),
              cancelText: Text("Закрити"),
              buttonText: Text("Вибрати міста"),
              title: Text("Міста"),
              searchHint: "Пошук міст",
              checkColor: Colors.white,
              selectedColor: Colors.black,
              initialChildSize: 0.7,
              maxChildSize: 0.7,
              searchable: true,
              initialValue: wizardState.agentCitiesIds,
              items: cities.map((e) => MultiSelectItem(e['id'], e['name'])).toList(),
              listType: MultiSelectListType.LIST,
              onConfirm: (values) {
                wizardState.setAgentCitiesIds(List<int>.from(values));
              },
            ),
          ],
        ),
         SizedBox(height: 48),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          StepButton(text: "Назад", next: false),
          StepButton(text: "Далі"),
        ])
      ],
    );
  }
}
