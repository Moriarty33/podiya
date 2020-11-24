import 'package:flutter/material.dart';
import 'package:podiya/pages/LeftPage.dart';
import 'package:podiya/pages/RightPage.dart';
import 'package:podiya/widgets/Agents/MainAgentsWidget.dart';
import 'package:podiya/widgets/Budget/MainBudgetWidget.dart';
import 'package:podiya/widgets/MainHeaderWidget.dart';
import 'package:podiya/widgets/Team/MainTeamWidget.dart';
import 'package:podiya/widgets/ToDo/MainToDoWidget.dart';
import 'package:podiya/widgets/favorites/MainFavoritesWidget.dart';
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
                body: MainHeaderWidget(
                    body: Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: ListView(padding: EdgeInsets.only(top: 32), children: [
                    MainAgentsWidget(),
                    SizedBox(height: 32),
                    MainToDoWidget(),
                    SizedBox(height: 32),
                    MainBudgetWidget(),
                    SizedBox(height: 32),
                    MainFavoritesWidget(),
                    SizedBox(height: 32),
                    MainTeamWidget(),
                    SizedBox(height: 32)
                  ]),
                )))));
  }
}
