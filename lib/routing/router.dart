import 'package:flutter/material.dart';

import 'package:smart_health/routing/routes.dart';

// Pages
import 'package:smart_health/pages/home_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomePageRoute:
      return MaterialPageRoute(builder: (context) => HomePage());
    default:
      return MaterialPageRoute(builder: (context) => HomePage());
  }
}