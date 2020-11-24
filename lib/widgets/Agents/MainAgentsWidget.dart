import 'package:flutter/material.dart';

import '../../theme.dart';
import 'MainAgentsList.dart';
import 'MainAgentsTabs.dart';

class MainAgentsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Text("Підрядники", style: HeaderStyle),
            Text("Показати Більше", style: ShowMoreStyle),
          ],
        ),
        MainAgentsTabs(),
        MainAgentsList(agents: [
          "Святослав Руденко",
          "Святослав Руденко",
          "Святослав Руденко",
          "Святослав Руденко",
          "Святослав Руденко"
        ])
      ],
    );
  }
}
