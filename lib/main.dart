import 'package:flutter/material.dart';

import 'package:smart_health/routing/router.dart' as router;
import 'package:smart_health/themes/custom_theme.dart' as customTheme;

import 'package:smart_health/pages/home_page.dart';

void main() => runApp(SmartHealthApp());

class SmartHealthApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Health',
      onGenerateRoute: router.generateRoute,
      theme: customTheme.getCustomTheme(),
      home: HomePage(),
    );
  }
}