import 'package:flutter/material.dart';
import 'package:podiya/state/drawer.dart';
import 'package:podiya/widgets/system/AppDrawer.dart';

import '../theme.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: AppDrawer(
      left: Container(),
      main: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/meet.png"), fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30),
                          IconButton(
                            icon: Icon(Icons.menu),
                            color: Colors.black,
                            alignment: Alignment.centerLeft,
                            onPressed: () {
                              toggleDrawer.value++;
                            },
                          ),
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
              ))),
    ));
  }
}
