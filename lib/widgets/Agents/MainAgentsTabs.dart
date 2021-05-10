import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:podiya/dao/TypesDao.dart';
import 'package:podiya/model/AgentType.dart';
import 'package:podiya/state/homeState.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class MainAgentsTabs extends StatelessWidget {
  late HomeState homeState;
  @override
  Widget build(BuildContext context) {
    homeState = Provider.of<HomeState>(context);
    return Container(
      height: 40,
      alignment: Alignment.centerLeft,
      child: FutureBuilder(
        future: TypesDao.getAgentTypesByIds(homeState.event!.types!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<AgentType> agents = snapshot.data as List<AgentType>;
            return Observer(
                builder: (_) => ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(agents.length, (index) {
                      return buildAgentTab(agents[index]);
                    })));
          } else {
            return Container();
          }
        },
      ),
    );
  }

  GestureDetector buildAgentTab(AgentType agent) {
    return GestureDetector(
      onTap: () {
        homeState.setAgentType(agent.id);
      },
      child: Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(right: 16, bottom: 8, top: 8),
          child: Text(agent.name,
              style: homeState.agentType == agent.id
                  ? AgentTabSelectedStyle
                  : AgentTabStyle)),
    );
  }
}
