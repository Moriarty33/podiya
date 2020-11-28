import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:podiya/model/UserData.dart';
import 'package:podiya/state/wizardState.dart';
import 'package:podiya/widgets/Wizard/StepButton.dart';
import 'package:provider/provider.dart';

import 'StepInfo.dart';

class GeneralInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WizardState wizardState = Provider.of<WizardState>(context);
    String name = FirebaseAuth.instance.currentUser.displayName;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            StepInfo(
                title: "Привіт, " + name + ", обери роль, яка тобі підходить!",
                subtitle: "Обери свою роль."),
            SizedBox(height: 64),
            RaisedButton(
              color: Colors.white,
              padding:
                  EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 12),
              onPressed: () {
                wizardState.setType(UserType.agent);
                wizardState.increment();
              },
              child: Text(
                "Я надаю послуги для подій!",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            SizedBox(height: 32),
            RaisedButton(
              color: Colors.black,
              padding:
                  EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 12),
              onPressed: () {
                wizardState.setType(UserType.user);
                wizardState.increment();
              },
              child: Text(
                "Я Хочу створити Подію!",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
