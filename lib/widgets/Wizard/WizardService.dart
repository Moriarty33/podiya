import 'package:flutter/material.dart';
import 'package:podiya/dao/AgentDao.dart';
import 'package:podiya/dao/EventDao.dart';
import 'package:podiya/dao/UserDataDao.dart';
import 'package:podiya/model/Agent.dart';
import 'package:podiya/model/Event.dart';
import 'package:podiya/model/UserData.dart';
import 'package:podiya/pages/HomePage.dart';

class WizardService {
  static userFinish(context, Event event) async {
    String id = await EventDao.saveEvent(event);
    await UserDataDao.createData(UserData(type: UserType.user, event: id));
    Future(() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                HomePage(message: "Подію успішно створенно!")),
      );
    });
  }

  static agentFinish(context, Agent agent) async {
    await UserDataDao.createData(UserData(type: UserType.agent));
    await AgentDao.saveAgent(agent);
    Future(() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                HomePage(message: "Подію успішно створенно!")),
      );
    });
  }
}
