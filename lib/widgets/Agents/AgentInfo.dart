import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:podiya/dao/RequestDao.dart';
import 'package:podiya/model/Agent.dart';
import 'package:podiya/model/Request.dart';
import 'package:podiya/state/homeState.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

final User user = FirebaseAuth.instance.currentUser!;

class AgentInfo extends StatelessWidget {
  Agent agent;
  late HomeState homeState;

  AgentInfo({required this.agent});

  @override
  Widget build(BuildContext context) {
    homeState = Provider.of<HomeState>(context);
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
        Center(
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                padding:
                    MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(16))),
            child: Text("ДОБАВИТИ В КОМАНДУ"),
            onPressed: () async {
              RequestDao.createRequest(Request(
                  toAgentId: agent.id,
                  fromUserId: user.uid,
                  eventId: homeState.event!.id!,
                  comment: "added"));
            },
          ),
        )
      ],
    );
  }
}
