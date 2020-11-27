import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:podiya/state/stepIndex.dart';
import 'package:podiya/widgets/Wizard/StepsIndicatorWidget.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class WizardPage extends StatefulWidget {
  @override
  _WizardPageState createState() => _WizardPageState();
}

class _WizardPageState extends State<WizardPage> {
  @override
  Widget build(BuildContext context) {
    StepIndex stepIndex = Provider.of<StepIndex>(context);

    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 100,
          elevation: 0.5,
          flexibleSpace: Padding(
            padding: EdgeInsets.only(top: 56.0, left: 12, right: 12),
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
      body: Container(),
      bottomSheet: Container(
          alignment: AlignmentDirectional.bottomCenter,
          padding: EdgeInsets.only(bottom: 56.0, left: 12, right: 12),
          child: RaisedButton(
            color: Colors.black,
            padding: EdgeInsets.only(left: 64, right: 64, top: 12, bottom: 12),
            onPressed: () {
              stepIndex.increment();
            },
            child: Text(
              "Далі",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          )),
    );
  }
}
