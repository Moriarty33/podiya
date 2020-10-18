import 'package:flutter/material.dart';
import 'package:podiya/state/drawer.dart';

import '../theme.dart';

class MainHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/meet.jpg"), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      IconButton(
                        icon: Icon(Icons.menu),
                        color: Colors.black,
                        alignment: Alignment.centerLeft,
                        onPressed: () {
                          toggleLeftDrawer.value++;
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.account_circle),
                        color: Colors.black,
                        alignment: Alignment.centerRight,
                        onPressed: () {
                          toggleRightDrawer.value++;
                        },
                      )
                    ]),
                    SizedBox(height: 120),
                    Text(
                      "Залишилось 29 днів",
                      style: EventDateMainPageStyle,
                    ),
                    Text(
                      "Корпоратив",
                      style: EventNameMainPageStyle,
                    ),
                  ],
                )),
          ],
        ));
  }
}
