import 'package:flutter/material.dart';
import 'package:podiya/state/wizardState.dart';
import 'package:podiya/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/cupertino.dart';

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
        Provider<WizardState>(
          create: (_) => WizardState(),
        )
      ],
      child: MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale("en", ""),
          ],
          title: 'Flutter Demo',
          theme: ThemeData(primaryColor: primaryColor),
          home: CheckAuthPage()),
    );
  }
}
