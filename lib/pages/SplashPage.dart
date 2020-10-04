import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podiya/widgets/SpinnerWidget.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return fullscreen();
  }

  fullscreen() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/splash.jpg"), fit: BoxFit.cover),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 148.00),
            Container(
                child: Text("Подія",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w200,
                        letterSpacing: 5))),
            SizedBox(height: 148.00),
            Container(
              child: SpinnerWidget(heightFactor: 0),
            ),
          ],
        ),
      ),
    );
  }
}
