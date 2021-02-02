import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podiya/state/homeState.dart';
import 'package:podiya/widgets/Agents/MainAgentsWidget.dart';
import 'package:podiya/widgets/Budget/MainBudgetWidget.dart';
import 'package:podiya/widgets/Favorites/MainFavoritesWidget.dart';
import 'package:podiya/widgets/Team/MainTeamWidget.dart';
import 'package:podiya/widgets/ToDo/MainToDoWidget.dart';
import 'package:provider/provider.dart';

import '../SpinnerWidget.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeState homeState = Provider.of<HomeState>(context);
    return FutureBuilder(
      future: homeState.init(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Material(child: SpinnerWidget(heightFactor: 1));
          default:
            if (snapshot.hasError)
              return Text('Error: ${snapshot.error}');
            else {
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
      },
    );
    ;
  }
}
