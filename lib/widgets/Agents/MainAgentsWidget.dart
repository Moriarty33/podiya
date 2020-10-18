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
          children: [Text("Підрядники", style: HeaderStyle)],
        ),
        MainAgentsTabs(),
        MainAgentsList()
      ],
    );
  }
}
