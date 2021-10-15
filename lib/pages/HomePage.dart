import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:podiya/pages/SettingsPage.dart';
import 'package:podiya/state/homeState.dart';
import 'package:podiya/widgets/HomeAppBarWidget.dart';
import 'package:podiya/widgets/home/HomeWidget.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class HomePage extends StatefulWidget {
  final String? message;

  const HomePage({
    Key? key,
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
        final snackBar = SnackBar(content: Text(widget.message!));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }
  }

  GlobalKey _bottomNavigationKey = GlobalKey();
  late HomeState homeState;
  late Widget _pageWidget;
  late PreferredSizeWidget _appBarWidget;

  @override
  Widget build(BuildContext context) {
    homeState = Provider.of<HomeState>(context);
    setPageWidget(homeState.page, context);
    reaction((_) => homeState.page, (int value) => setPageWidget(value, context));
    return Material(
        child: Scaffold(
            bottomNavigationBar: nivigation(),
            backgroundColor: Colors.white,
            appBar: _appBarWidget,
            body: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: _pageWidget,
            )));
  }

  Widget nivigation() {
    return CurvedNavigationBar(
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
        homeState.setPage(index);
      }
    );
  }

  setPageWidget(int page, BuildContext context) {
    setState(() {
      if (page == 0) {
        _appBarWidget = HomeAppBarWidget();
        _pageWidget = HomeWidget();
      }

      if (page == 1) {
        _appBarWidget = HomeAppBarWidget();
        _pageWidget = Material(
            child: Container(padding: EdgeInsets.all(65), child: Text("list")));
      }

      if (page == 2) {
        _appBarWidget = appbar("Settings");
        _pageWidget = Material(
            child: SettingsPage());
      }
    });
  }

  PreferredSizeWidget appbar(String title) {
    return AppBar(
        backgroundColor: Colors.white70,
        brightness: Brightness.light,
        elevation: 1.2,
        centerTitle: false,
        title: Text(title, style: EventNameMainPageStyle),
        toolbarHeight: 64.0);
  }
}
