import 'package:flutter/material.dart';
import 'package:podiya/widgets/system/AppBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: CustomAppBar(title: 'Подія'),
            body: Container(
                margin: EdgeInsets.all(128),
                child: Container(child: Text("HOME")))));
  }
}
