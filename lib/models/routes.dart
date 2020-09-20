import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleRoute {
  IconData icon;
  String name;
  double distance;
  Marker marker;

  GoogleRoute({IconData icon, String name, double distance, Marker marker}) {
    this.icon = icon;
    this.name = name;
    this.distance = distance;
    this.marker = marker;
  }
}
