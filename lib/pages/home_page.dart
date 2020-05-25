import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_health/themes/custom_theme.dart';

import 'package:smart_health/widgets/custom_appbar.dart';
import 'package:smart_health/widgets/news_widget.dart';
import 'package:smart_health/widgets/user_details_column.dart';
import 'package:smart_health/widgets/weather_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          tooltip: "Emergency contact",
          child: Icon(
            Icons.phone,
            color: Colors.white,
          ),
          onPressed: () {
            // TODO: OPEN EMERGENCY MODAL
          },
        ),
        appBar: CustomAppBar(),
        body: Column(
          children: <Widget>[
            Center(child: UserDetailsColumn()),
            WeatherWidget(),
            Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Text(
                "News from your region: ",
                style: GoogleFonts.lato(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              ),
            ),
            NewsWidget(),
            // TODO: ADD BOTTOM NAVBAR
          ],
        ),
      ),
    );
  }
}
