import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'StepButton.dart';
import 'StepInfo.dart';
import '../../data/cities.dart';

class EventCityStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                items: cities,
                label: "Вибране місто",
                onChanged: print,
                selectedItem: cities[0]),
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
