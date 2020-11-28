import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:podiya/state/wizardState.dart';
import 'package:podiya/widgets/SpinnerWidget.dart';
import 'package:podiya/widgets/Wizard/EventAgentTypeStep.dart';
import 'package:podiya/widgets/Wizard/EventCityStep.dart';
import 'package:podiya/widgets/Wizard/EventDateStep.dart';
import 'package:podiya/widgets/Wizard/EventNameStep.dart';
import 'package:podiya/widgets/Wizard/GeneralInfo.dart';
import 'package:podiya/widgets/Wizard/StepsIndicatorWidget.dart';
import 'package:provider/provider.dart';

import '../theme.dart';
import 'HomePage.dart';

class WizardPage extends StatefulWidget {
  @override
  _WizardPageState createState() => _WizardPageState();
}

class _WizardPageState extends State<WizardPage> {
  @override
  Widget build(BuildContext context) {
    WizardState wizardState = Provider.of<WizardState>(context);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            toolbarHeight: 100,
            elevation: 0,
            flexibleSpace: Padding(
              padding: EdgeInsets.only(top: 56.0, left: 16, right: 12),
              child: Column(
                children: [
                  Container(
                    child: Text("Подія", style: HeaderStyle),
                  ),
                  SizedBox(height: 24),
                  Container(
                    alignment: AlignmentDirectional.topStart,
                    child: StepsIndicatorWidget(count: 6),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.white,
            brightness: Brightness.light),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Observer(builder: (_) {
            switch (wizardState.step) {
              case 0:
                return GeneralInfo();
              case 1:
                return EventNameStep();
              case 2:
                return EventDateStep();
              case 3:
                return EventCityStep();
              case 4:
                return EventAgentTypeStep();
              case 5:
                finish(context);
                return SpinnerWidget(heightFactor: 0);
              default:
                return GeneralInfo();
            }
          }),
        ));
  }

  finish(context) {
    Future(() {
 Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
    });
   
  }
}
