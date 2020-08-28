import 'package:flutter/material.dart';
import 'package:smart_health/pages/routes_page.dart';
import 'package:smart_health/routing/routes.dart';

// Pages
import 'package:smart_health/pages/home_page.dart';
import 'package:smart_health/pages/profile_page.dart';
import 'package:smart_health/pages/weather_page.dart';
import 'package:smart_health/pages/records_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomePageRoute:
      return MaterialPageRoute(builder: (context) => HomePage());
    case PersonalRoutesPageRoute:
      return MaterialPageRoute(builder: (context) => RoutesPage());
    case WeatherPageRoute:
      return MaterialPageRoute(builder: (context) => WeatherPage());
    case ProfilePageRoute:
      return MaterialPageRoute(builder: (context) => ProfilePage());
    case RecordsPageRoute:
      return MaterialPageRoute(builder: (context) => RecordsPage());
    case NotificationsPageRoute:
    // TODO: Needs to be impelemented
      throw UnimplementedError("Notifications route isn't implemented!");
    default:
      return MaterialPageRoute(builder: (context) => HomePage());
  }
}