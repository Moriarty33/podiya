import 'package:flutter/material.dart';
import 'package:podiya/theme.dart';

import 'pages/CheckAuthPage.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primaryColor: primaryColor),
        home: CheckAuthPage());
  }
}
