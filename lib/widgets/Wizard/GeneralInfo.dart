import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:podiya/widgets/Wizard/StepButton.dart';

import 'StepInfo.dart';

class GeneralInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String name = FirebaseAuth.instance.currentUser.displayName;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            StepInfo(
                title: "Привіт, " + name + ", обери роль, яка тобі підходить!",
                subtitle:
                    "Вкажи своє імя, саме це імя будуть бачити інші користувачі, а також обери свою роль."),
          ],
        ),
        StepButton(text: "Далі"),
      ],
    );
  }
}
