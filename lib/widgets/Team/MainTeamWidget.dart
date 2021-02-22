import 'package:flutter/material.dart';
import 'package:podiya/widgets/Agents/MainAgentsList.dart';

import '../../theme.dart';

class MainTeamWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        Text("Моя Команда", style: HeaderStyle),
      ]),
      MainAgentsList(agents: [])
    ]);
  }
}
