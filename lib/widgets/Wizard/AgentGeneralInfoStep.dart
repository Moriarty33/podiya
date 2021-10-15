import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:podiya/state/wizardState.dart';
import 'package:provider/provider.dart';
import 'package:podiya/theme.dart';

import 'StepButton.dart';
import 'StepInfo.dart';

class AgentGeneralInfoStep extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final descriptionField = TextEditingController();
  late WizardState wizardState;

  @override
  Widget build(BuildContext context) {
    wizardState = Provider.of<WizardState>(context);
    descriptionField.text = wizardState.agentDescription;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            StepInfo(
                title: "Розкажи нам більше про свою роботу!",
                subtitle:
                    "Заповни інформацію про себе, додай короткий опис, обери міста в яких ти працюєш та вкажи прайс за свої послуги."),
            SizedBox(height: 48),
            Form(
                key: _formKey,
                child: Column(children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Розкажи який ти крутий професіонал'),
                    keyboardType: TextInputType.multiline,
                    controller: descriptionField,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Будь ласка введіть інформацію';
                      }
                      return null;
                    },
                  )
                ])),
            SizedBox(height: 32),
            slider()
          ],
        ),
         SizedBox(height: 48),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          StepButton(text: "Назад", next: false),
          StepButton(
              text: "Далі",
              next: true,
              cb: () {
                if (_formKey.currentState!.validate()) {
                  wizardState.setAgentDescription(descriptionField.text.trim());
                  wizardState.increment();
                }
              }),
        ])
      ],
    );
  }

  Widget slider() {
    return Observer(
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Зазнач ціну від якої ти готовий співпрацювати"),
          Slider(
            value: wizardState.agentAmount,
            activeColor: Colors.black,
            min: 0,
            max: 50000,
            divisions: 250,
            label: formatMoney(wizardState.agentAmount),
            onChanged: (double value) {
              wizardState.setAgentAmount(value);
            },
          ),
          SizedBox(height: 8),
          Text(formatMoney(wizardState.agentAmount), style: WizardTitle),
        ],
      ),
    );
  }

  formatMoney(value) {
    return "Від " + value.round().toString() + " грн.";
  }
}
