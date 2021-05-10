import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:podiya/state/homeState.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  late HomeState homeState;

  Widget events() {
    return GestureDetector(
      child: Container(
          margin: EdgeInsets.only(right: 12, top: 4),
          child: Icon(
            Icons.add_circle_sharp,
            color: Colors.black,
            size: 32,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    homeState = Provider.of<HomeState>(context);
    return AppBar(
        backgroundColor: Colors.white70,
        brightness: Brightness.light,
        elevation: 1.2,
        actions: [events()],
        centerTitle: false,
        title: Observer(
          builder: (_) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(homeState.event?.name?.toString() ?? "",
                  style: EventNameMainPageStyle),
              Text("Залишилось 29 днів", style: EventDateMainPageStyle)
            ],
          ),
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(64);
}
