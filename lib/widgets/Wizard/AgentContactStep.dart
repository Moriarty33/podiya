import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:podiya/model/AgentLinks.dart';
import 'package:podiya/state/wizardState.dart';
import 'package:provider/provider.dart';

import 'StepButton.dart';
import 'StepInfo.dart';

class AgentContactStep extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  WizardState wizardState;

  @override
  Widget build(BuildContext context) {
    wizardState = Provider.of<WizardState>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            StepInfo(
                title: "Розкажи нам більше про свою роботу!",
                subtitle:
                    "Твоя контактна інформація. Додай свій номер телефону, посилання на сайт, соціальні мережі тощо."),
            SizedBox(height: 32),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  phoneNumber(wizardState.agentPhoneNumber),
                  SizedBox(height: 24),
                  webSite(),
                  SizedBox(height: 8),
                  facebook(),
                  SizedBox(height: 8),
                  instagram(),
                  SizedBox(height: 8),
                  other()
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 48),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          StepButton(text: "Назад", next: false),
          StepButton(
              text: "Далі",
              next: true,
              cb: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  AgentLinks agentLinks = AgentLinks(
                    website: webSiteController.text,
                    facebook: facebookController.text,
                    instagram: instagramController.text,
                    other: otherController.text,
                  );
                  wizardState.setAgentLink(agentLinks);
                  wizardState.increment();
                }
              }),
        ])
      ],
    );
  }

  final TextEditingController webSiteController = TextEditingController();

  Widget webSite() {
    webSiteController.text = wizardState.agentLinks.website;
    return TextFormField(
        decoration: InputDecoration(hintText: 'Веб Сайт'),
        controller: webSiteController);
  }

  final TextEditingController facebookController = TextEditingController();

  Widget facebook() {
    facebookController.text = wizardState.agentLinks.facebook;
    return TextFormField(
        decoration: InputDecoration(hintText: 'Фейсбук'),
        controller: facebookController);
  }

  final TextEditingController instagramController = TextEditingController();

  Widget instagram() {
    instagramController.text = wizardState.agentLinks.instagram;
    return TextFormField(
        decoration: InputDecoration(hintText: 'Інстаграм'),
        controller: instagramController);
  }

  final TextEditingController otherController = TextEditingController();

  Widget other() {
    otherController.text = wizardState.agentLinks.other;
    return TextFormField(
        decoration: InputDecoration(hintText: 'Інше посилання'),
        controller: otherController);
  }

  final TextEditingController phoneNumberController = TextEditingController();
  String initialCountry = 'UA';

  Widget phoneNumber(String phoneNumber) {
    PhoneNumber number =
        PhoneNumber(isoCode: initialCountry, phoneNumber: phoneNumber);
    return InternationalPhoneNumberInput(
        onSaved: (PhoneNumber number) {
          wizardState.setAgentPhoneNumber(number.phoneNumber);
        },
        hintText: "93 777 7777",
        cursorColor: Colors.black,
        selectorConfig: SelectorConfig(showFlags: false),
        ignoreBlank: false,
        autoValidateMode: AutovalidateMode.onUserInteraction,
        errorMessage: "Номер телефону має не вірний формат",
        selectorTextStyle: TextStyle(color: Colors.black),
        initialValue: number,
        textFieldController: phoneNumberController,
        formatInput: true,
        countries: ["UA"],
        keyboardType: TextInputType.numberWithOptions(decimal: true));
  }
}
