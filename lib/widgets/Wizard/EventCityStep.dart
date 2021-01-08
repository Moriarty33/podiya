import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:podiya/state/wizardState.dart';
import 'package:provider/provider.dart';

import 'StepButton.dart';
import 'StepInfo.dart';
import '../../data/cities.dart';

class EventCityStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> cityNames = cities.map((e) => e["name"] as String).toList();
    WizardState wizardState = Provider.of<WizardState>(context);
    String selectedItem = wizardState.eventCity != null
        ? findCityById(wizardState.eventCity)["name"]
        : cityNames[0];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            StepInfo(
                title: "Розкажи нам більше про свою Подію :) ",
                subtitle: "В якому місті буде подія?"),
            SizedBox(height: 48),
            DropdownSearch<String>(
              mode: Mode.MENU,
              showSelectedItem: true,
              showSearchBox: true,
              items: cityNames,
              label: "Вибране місто",
              selectedItem: selectedItem,
              onChanged: (cityName) {
                wizardState.setCity(findCityByName(cityName)["id"] as int);
              },
            ),
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
