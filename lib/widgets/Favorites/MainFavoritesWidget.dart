import 'package:flutter/material.dart';
import 'package:podiya/widgets/Agents/MainAgentsList.dart';

import '../../theme.dart';

class MainFavoritesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text("Мої збереження", style: HeaderStyle),
            Text("Показати Більше", style: ShowMoreStyle),
          ]),
      MainAgentsList(agents: [])
    ]);
  }
}
