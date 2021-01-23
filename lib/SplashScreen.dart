import 'package:dark_mode_using_provider/dark_theme/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Material(
      child: Scaffold(
        body: Container(
          child: Center(
            child: Checkbox(
                value: themeChange.darkTheme,
                onChanged: (bool value) {
                  themeChange.darkTheme = value;
                }),
          ),
        ),
      ),
    );
  }
}
