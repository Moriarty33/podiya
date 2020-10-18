import 'package:flutter/material.dart';
import 'package:podiya/pages/LeftPage.dart';
import 'package:podiya/pages/RightPage.dart';
import 'package:podiya/widgets/Agents/MainAgentsWidget.dart';
import 'package:podiya/widgets/MainHeaderWidget.dart';
import 'package:podiya/widgets/system/AppDrawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: AppDrawer(
            left: LeftPage(),
            right: RightPage(),
            main: Scaffold(
              backgroundColor: Colors.white,
              body: Column(children: [
                MainHeaderWidget(),
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16, top: 32),
                  child: Column(
                    children: [
                        MainAgentsWidget()
                      ]
                    ),
                )
              ]),
            )));
  }
}
