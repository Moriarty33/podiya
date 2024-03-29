import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:podiya/state/homeState.dart';
import 'package:podiya/state/wizardState.dart';
import 'package:podiya/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/cupertino.dart';

import 'pages/CheckAuthPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        ),
        Provider<HomeState>(
          create: (_) => HomeState(),
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
