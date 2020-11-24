import 'package:flutter/material.dart';
import 'package:podiya/widgets/Agents/AgentCardWidget.dart';

class MainAgentsList extends StatelessWidget {
  final List<String> agents;

  MainAgentsList({this.agents});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        margin: EdgeInsets.only(top: 24),
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(agents.length, (index) {
              return AgentCardWidget(name: agents[index]);
            })));
  }
}
