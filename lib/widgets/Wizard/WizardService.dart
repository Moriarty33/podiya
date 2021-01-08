import 'package:flutter/material.dart';
import 'package:podiya/dao/EventDao.dart';
import 'package:podiya/dao/UserDataDao.dart';
import 'package:podiya/model/Event.dart';
import 'package:podiya/model/UserData.dart';
import 'package:podiya/pages/HomePage.dart';

class WizardService {
  static finish(context, Event event, UserType type) async {
    await UserDataDao.createData(UserData(type: type));
    await EventDao.saveEvent(event);
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
