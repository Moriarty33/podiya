import 'package:flutter/material.dart';
import 'package:podiya/state/wizardState.dart';
import 'package:provider/provider.dart';

class StepButton extends StatelessWidget {
  final String text;
  final bool next;
  final Function() cb;

  const StepButton({this.text, this.next = true, this.cb});

  @override
  Widget build(BuildContext context) {
    WizardState wizardState = Provider.of<WizardState>(context);

    return Container(
        alignment: AlignmentDirectional.bottomCenter,
        padding: EdgeInsets.only(bottom: 40.0, left: 12, right: 12),
        child: RaisedButton(
          color: Colors.black,
          padding: EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 12),
          onPressed: () {
            if (this.cb != null) {
              cb();
              return;
            }

            if (this.next) {
              wizardState.increment();
            } else {
              wizardState.decrement();
            }
          },
          child: Text(
            this.text,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ));
  }
}
