import 'package:flutter/material.dart';
import 'package:podiya/model/Agent.dart';

import '../../theme.dart';

class AgentInfo extends StatelessWidget {
  Agent agent;

  AgentInfo({this.agent});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(agent.firstname + " " + agent.lastname,
            style: HeaderStyle, textAlign: TextAlign.start),
        SizedBox(height: 8),
        Text(agent.formatMoney(),
            style: MoneyStyle, textAlign: TextAlign.start),
        SizedBox(height: 8),
        Row(children: [
          Icon(Icons.location_on, color: Colors.black45),
          Text(agent.formatCities().toString())
        ]),
        SizedBox(height: 20),
        Text("Додаткова інформація",
            style: EventNameMainPageStyle, textAlign: TextAlign.start),
        SizedBox(height: 8),
        Text(agent.description,
            style: AgentDescription, textAlign: TextAlign.start),
        SizedBox(height: 24),
        Center(child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
              padding:
              MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(16))),
          child: Text("ДОБАВИТИ В КОМАНДУ"),
          onPressed: () {
            print("Add to team");
          },
        ),)

      ],
    );
  }
}
