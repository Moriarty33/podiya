import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:podiya/model/UserData.dart';
import 'package:podiya/state/wizardState.dart';
import 'package:podiya/widgets/SpinnerWidget.dart';
import 'package:podiya/widgets/Wizard/AgentCitiesStep.dart';
import 'package:podiya/widgets/Wizard/AgentContactStep.dart';
import 'package:podiya/widgets/Wizard/AgentGeneralInfoStep.dart';
import 'package:podiya/widgets/Wizard/AgentImageStep.dart';
import 'package:podiya/widgets/Wizard/EventAgentTypeStep.dart';
import 'package:podiya/widgets/Wizard/EventCityStep.dart';
import 'package:podiya/widgets/Wizard/EventDateStep.dart';
import 'package:podiya/widgets/Wizard/EventNameStep.dart';
import 'package:podiya/widgets/Wizard/GeneralInfo.dart';
import 'package:podiya/widgets/Wizard/StepsIndicatorWidget.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class WizardPage extends StatefulWidget {
  @override
  _WizardPageState createState() => _WizardPageState();
}

class _WizardPageState extends State<WizardPage> {
  Widget _stepWidget = GeneralInfo();
  late WizardState wizardState;
  int _stepsCount = 5;

  @override
  Widget build(BuildContext context) {
    wizardState = Provider.of<WizardState>(context);

    reaction((_) => wizardState.step, (value) {
      setState(() {
        _stepWidget = renderWidget(value, wizardState.type!, context);
        _stepsCount = wizardState.type == UserType.agent ? 7 : 6;
      });
    });

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
                    child: StepsIndicatorWidget(count: _stepsCount),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.white,
            brightness: Brightness.light),
        body: CustomScrollView(slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              padding: EdgeInsets.all(16),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 200),
                child: _stepWidget,
              ),
            ),
          ),
        ]));
  }

  Widget renderWidget(step, UserType type, context) {
    if (step == 0) {
      return GeneralInfo();
    }

    if (type == UserType.user) {
      switch (step) {
        case 1:
          return EventNameStep();
        case 2:
          return EventDateStep();
        case 3:
          return EventCityStep();
        case 4:
          return EventAgentTypeStep();
        case 5:
          return SpinnerWidget(heightFactor: 0);
      }
    } else {
      switch (step) {
        case 1:
          return EventAgentTypeStep();
        case 2:
          return AgentGeneralInfoStep();
        case 3:
          return AgentCitiesStep();
        case 4:
          return AgentContactStep();
        case 5:
          return AgentImageStep();
        case 6:
          return SpinnerWidget(heightFactor: 0);
      }
    }

    return GeneralInfo();
  }
}
