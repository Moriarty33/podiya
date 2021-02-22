import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:podiya/dao/AgentDao.dart';
import 'package:podiya/model/Agent.dart';
import 'package:podiya/state/homeState.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';
import '../SpinnerWidget.dart';
import 'MainAgentsList.dart';
import 'MainAgentsTabs.dart';

class MainAgentsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeState homeState = Provider.of<HomeState>(context);
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
        Observer(
            builder: (_) => FutureBuilder(
                  future: AgentDao.getAgents(homeState.agentType),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      List<Agent> agents = snapshot.data;
                      return MainAgentsList(agents: agents);
                    } else {
                      return Container(
                          height: 158, child: SpinnerWidget(heightFactor: 1));
                    }
                  },
                ))
      ],
    );
  }
}
