import 'package:flutter/material.dart';
import 'package:podiya/state/drawer.dart';

import '../theme.dart';

class MainHeaderWidget extends StatefulWidget {
  final Widget body;

  MainHeaderWidget({this.body});

  @override
  _MainHeaderWidgetState createState() => _MainHeaderWidgetState();
}

class _MainHeaderWidgetState extends State<MainHeaderWidget> {
  ScrollController _scrollController;
  double expandedHeight = 228.0;
  @override
  void initState() {
    _scrollController = ScrollController()..addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: expandedHeight,
              backgroundColor: Colors.white,
              floating: true,
              pinned: true,
              leading: menu(),
              actions: [profile()],
              flexibleSpace: title(),
            ),
          ];
        },
        body: this.widget.body);
  }

  double get _horizontalTitlePadding {
    const kBasePadding = 16.0;
    const kMultiplier = 0.7;

    if (_scrollController.hasClients) {
      if (_scrollController.offset < (expandedHeight / 2)) {
        // In case 50%-100% of the expanded height is viewed
        return kBasePadding;
      }

      if (_scrollController.offset > (expandedHeight - kToolbarHeight)) {
        // In case 0% of the expanded height is viewed
        return (expandedHeight / 2 - kToolbarHeight) * kMultiplier +
            kBasePadding;
      }

      // In case 0%-50% of the expanded height is viewed
      return (_scrollController.offset - (expandedHeight / 2)) * kMultiplier +
          kBasePadding;
    }

    return kBasePadding;
  }

  Widget menu() {
    return GestureDetector(
      onTap: () {
        toggleLeftDrawer.value++;
      },
      child: Container(
          margin: const EdgeInsets.only(top: 4),
          child: Icon(
            Icons.menu,
            color: Colors.black,
            size: 32,
          )),
    );
  }

  Widget profile() {
    return GestureDetector(
      onTap: () {
        toggleRightDrawer.value++;
      },
      child: Container(
          margin: EdgeInsets.only(right: 12, top: 4),
          child: Icon(
            Icons.account_circle,
            color: Colors.black,
            size: 32,
          )),
    );
  }

  Widget title() {
    return FlexibleSpaceBar(
        titlePadding: EdgeInsets.symmetric(
            vertical: 8.0, horizontal: _horizontalTitlePadding),
        centerTitle: false,
        title: Stack(children: [
          Container(
              margin: EdgeInsets.only(top: 18, bottom: 4),
              child: Text("Залишилось 29 днів", style: EventDateMainPageStyle)),
          Text("Корпоратив", style: EventNameMainPageStyle),
        ]),
        background: Image.asset(
          "images/meet.jpg",
          fit: BoxFit.cover,
        ));
  }
}
