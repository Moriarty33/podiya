import 'package:flutter/material.dart';
import 'package:podiya/theme.dart';

class StepInfo extends StatelessWidget {
  final String title;
  final String subtitle;

  const StepInfo({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: WizardTitle),
      SizedBox(height: 12),
      Text(subtitle, style: WizardSubTitle)
    ]);
  }
}
