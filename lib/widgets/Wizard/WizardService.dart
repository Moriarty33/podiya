import 'package:flutter/material.dart';
import 'package:podiya/dao/EventDao.dart';
import 'package:podiya/model/Event.dart';
import 'package:podiya/pages/HomePage.dart';

class WizardService {
  static finish(context, Event event) async {
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
