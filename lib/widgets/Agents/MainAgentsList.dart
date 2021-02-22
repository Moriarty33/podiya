import 'package:flutter/material.dart';
import 'package:podiya/model/Agent.dart';
import 'package:podiya/widgets/Agents/AgentCardWidget.dart';

class MainAgentsList extends StatelessWidget {
  final List<Agent> agents;

  MainAgentsList({this.agents});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        margin: EdgeInsets.only(top: 8),
        child: agents.length > 0
            ? buildListView()
            : Center(child: Text("Немає підрядників в даній категорії")));
  }

  ListView buildListView() {
    return ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(agents.length, (index) {
          return AgentCardWidget(agent: agents[index]);
        }));
  }
}
