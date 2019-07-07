import 'package:flutter/material.dart';
import '../exports.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: themeData.appBarTheme.copyWith(
          elevation: 0,
        ),
      ),
      home: BootstrapScreen(),
    );
  }
}
