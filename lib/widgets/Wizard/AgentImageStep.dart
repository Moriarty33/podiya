import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:podiya/dao/ImagesDao.dart';
import 'package:podiya/state/wizardState.dart';
import 'package:provider/provider.dart';

import 'SelectImages.dart';
import 'StepButton.dart';
import 'StepInfo.dart';

class AgentImageStep extends StatelessWidget {
  WizardState wizardState;
  int selectedImage;
  List<Asset> uploadedImages;

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
                    "Останній крок - добав декілька фото до свого профілю а потім вибери головне."),
            SizedBox(height: 24),
            SelectImages(cbImage: (int image) {
              selectedImage = image;
            }, cbImages: (List<Asset> images) {
              uploadedImages = images;
            })
          ],
        ),
        SizedBox(height: 48),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          StepButton(text: "Назад", next: false),
          StepButton(
              text: "Готово",
              cb: () async {
                await handeFinish(context);
              }),
        ])
      ],
    );
  }

  showMessage(context, message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  handeFinish(context) async {
    if (uploadedImages?.length == 0) {
      showMessage(context, "Загрузіть фото для вашого профілю");
      return;
    }
    if (selectedImage == null) {
      showMessage(context, "Натисніть на фото щоб вибрати головне");
      return;
    }

    List<String> urls = await ImagesDao.uploadImages(uploadedImages);
    wizardState.setAgentImages(urls);
    wizardState.setAgentImage(urls[selectedImage]);
  }
}
