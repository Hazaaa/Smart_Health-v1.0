import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_health/custom_widgets/appbar.dart';
import 'package:smart_health/custom_widgets/drawer.dart';
import 'package:smart_health/custom_widgets/emergency_float_button.dart';
import 'package:smart_health/custom_widgets/news_widget.dart';
import 'package:smart_health/custom_widgets/user_details_column.dart';
import 'package:smart_health/custom_widgets/weather_widget.dart';

class WeatherPage extends StatefulWidget {
  WeatherPage({Key key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: EmergencyFloatButton(),
        appBar: CustomAppBar(),
        drawer: CustomDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.4216,
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 30.0),
                  Text(
                    "Weather",
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 35.0,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    "San Francisco",
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "32°C",
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 40.0,
                            fontWeight: FontWeight.w700),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "Condition: ",
                                style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "Sunny",
                                style: GoogleFonts.lato(
                                    color: Colors.white, fontSize: 20.0),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "Humidity: ",
                                style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "89%",
                                style: GoogleFonts.lato(
                                    color: Colors.white, fontSize: 20.0),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "Wind: ",
                                style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "5.5 km/h",
                                style: GoogleFonts.lato(
                                    color: Colors.white, fontSize: 20.0),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "UV: ",
                                style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "6",
                                style: GoogleFonts.lato(
                                    color: Colors.white, fontSize: 20.0),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Divider(thickness: 5.0, height: 5.0,),
            Container(
              height: MediaQuery.of(context).size.height * 0.465,
              color: Colors.yellow,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 30.0),
                  Text(
                    "Air quality",
                    style: GoogleFonts.lato(
                        color: Colors.black54,
                        fontSize: 35.0,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    "San Francisco",
                    style: GoogleFonts.lato(
                        color: Colors.black54,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 40.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "SO2: ",
                                style: GoogleFonts.lato(
                                    color: Colors.black54,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "3.0 µg/m³",
                                style: GoogleFonts.lato(
                                    color: Colors.black54, fontSize: 20.0),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "CO: ",
                                style: GoogleFonts.lato(
                                    color: Colors.black54,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "8.0 mg/m³",
                                style: GoogleFonts.lato(
                                    color: Colors.black54, fontSize: 20.0),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "NO: ",
                                style: GoogleFonts.lato(
                                    color: Colors.black54,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "40.0 µg/m³",
                                style: GoogleFonts.lato(
                                    color: Colors.black54, fontSize: 20.0),
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "NO2: ",
                                style: GoogleFonts.lato(
                                    color: Colors.black54,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "57.0 µg/m³",
                                style: GoogleFonts.lato(
                                    color: Colors.black54, fontSize: 20.0),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "O3: ",
                                style: GoogleFonts.lato(
                                    color: Colors.black54,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "7.0 µg/m³",
                                style: GoogleFonts.lato(
                                    color: Colors.black54, fontSize: 20.0),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "H25: ",
                                style: GoogleFonts.lato(
                                    color: Colors.black54,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "2.1 µg/m³",
                                style: GoogleFonts.lato(
                                    color: Colors.black54, fontSize: 20.0),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
