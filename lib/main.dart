import 'package:flutter/material.dart';
import 'package:podiya/state/stepIndex.dart';
import 'package:podiya/theme.dart';
import 'package:provider/provider.dart';

import 'pages/CheckAuthPage.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<StepIndex>(
          create: (_) => StepIndex(),
        )
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(primaryColor: primaryColor),
          home: CheckAuthPage()),
    );
  }
}
