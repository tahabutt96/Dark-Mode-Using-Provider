import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dark_mode_using_provider/SplashScreen.dart';
import 'package:dark_mode_using_provider/dark_theme/dark_theme_provider.dart';
//import 'package:dark_mode_using_provider/dark_theme/dark_theme_styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
    await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider(
        create: (_) {
          return themeChangeProvider;
        },
        child: Consumer<DarkThemeProvider>(
          builder: (BuildContext context, value, Widget child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: Styles.themeData(themeChangeProvider.darkTheme, context),
              home: SplashScreen(),
              // routes: <String, WidgetBuilder>{
              //   AGENDA: (BuildContext context) => AgendaScreen(),
              // },
            );
          },
        ),);
  }
}
