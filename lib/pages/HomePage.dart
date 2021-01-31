import 'package:flutter/material.dart';
import 'package:podiya/dao/EventDao.dart';

import 'package:podiya/pages/SplashPage.dart';
import 'package:podiya/state/homeState.dart';
import 'package:podiya/widgets/Agents/MainAgentsWidget.dart';
import 'package:podiya/widgets/Budget/MainBudgetWidget.dart';
import 'package:podiya/widgets/HomeAppBarWidget.dart';
import 'package:podiya/widgets/Team/MainTeamWidget.dart';
import 'package:podiya/widgets/ToDo/MainToDoWidget.dart';
import 'package:podiya/widgets/favorites/MainFavoritesWidget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final String message;

  const HomePage({
    Key key,
    this.message,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    if (widget.message != null) {
      Future(() {
        final snackBar = SnackBar(content: Text(widget.message));
        Scaffold.of(context).showSnackBar(snackBar);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    HomeState homeState = Provider.of<HomeState>(context);
    return Material(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: HomeAppBarWidget(),
            body: FutureBuilder(
              future: EventDao.getEvents(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return SplashPage();
                  default:
                    if (snapshot.hasError)
                      return Text('Error: ${snapshot.error}');
                    else {
                      homeState.setEvents(snapshot.data);
                      return loyout(context);
                    }
                }
              },
            )));
  }

  Widget loyout(context) {
    return Container(
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
    );
  }
}
