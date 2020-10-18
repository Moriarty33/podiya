import 'package:flutter/material.dart';

class MainAgentsList extends StatelessWidget {
  final List<String> agents = [
    "Святослав Руденко",
    "Святослав Руденко",
    "Святослав Руденко",
    "Святослав Руденко",
    "Святослав Руденко"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        margin: EdgeInsets.only(top: 24),
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(agents.length, (index) {
              return Container(
                width: 108,
                margin: EdgeInsets.only(right: 10),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(16.0),
                  color: Colors.grey,
                ),
                child: Container(
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                    child: Text(agents[index])),
              );
            })));
  }
}
