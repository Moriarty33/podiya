import 'package:flutter/material.dart';
import 'package:podiya/dao/EventDao.dart';
import 'package:podiya/state/homeState.dart';
import 'package:podiya/widgets/Agents/MainAgentsWidget.dart';
import 'package:podiya/widgets/Budget/MainBudgetWidget.dart';
import 'package:podiya/widgets/HomeAppBarWidget.dart';
import 'package:podiya/widgets/SpinnerWidget.dart';
import 'package:podiya/widgets/Team/MainTeamWidget.dart';
import 'package:podiya/widgets/ToDo/MainToDoWidget.dart';
import 'package:podiya/widgets/favorites/MainFavoritesWidget.dart';
import 'package:provider/provider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

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

  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    HomeState homeState = Provider.of<HomeState>(context);
    return Material(
        child: Scaffold(
            bottomNavigationBar: CurvedNavigationBar(
              key: _bottomNavigationKey,
              index: 0,
              height: 64.0,
              items: <Widget>[
                Icon(Icons.home, size: 30),
                Icon(Icons.list, size: 30),
                Icon(Icons.perm_identity, size: 30)
              ],
              color: Colors.white,
              buttonBackgroundColor: Colors.white,
              backgroundColor: Colors.blueAccent,
              animationCurve: Curves.easeInOut,
              animationDuration: Duration(milliseconds: 500),
              onTap: (index) {
                setState(() {
                  _page = index;
                });
              },
              letIndexChange: (index) => true,
            ),
            backgroundColor: Colors.white,
            appBar: HomeAppBarWidget(),
            body: FutureBuilder(
              future: EventDao.getEvent(homeState.userData.event),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return SpinnerWidget(heightFactor: 1);
                  default:
                    if (snapshot.hasError)
                      return Text('Error: ${snapshot.error}');
                    else {
                      homeState.setEvent(snapshot.data);
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
