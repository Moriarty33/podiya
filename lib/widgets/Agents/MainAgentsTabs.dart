import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:podiya/state/agentType.dart';

import '../../theme.dart';

class MainAgentsTabs extends StatelessWidget {
  final List<String> agentTypes = [
    "Ведучий",
    "Фотограф",
    "Флорист",
    "Музикант",
    "sdsdsd",
    "sdasdsd"
  ];
  final agentType = AgentType();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      alignment: Alignment.centerLeft,
      child: Observer(
          name: "agentType",
          builder: (_) => ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(agentTypes.length, (index) {
                return GestureDetector(
                  onTap: () {
                    agentType.set(index);
                  },
                  child: Container(
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.only(right: 16),
                      child: Text(agentTypes[index].toString(),
                          style: agentType.value == index
                              ? AgentTabSelectedStyle
                              : AgentTabStyle)),
                );
              }))),
    );
  }
}
