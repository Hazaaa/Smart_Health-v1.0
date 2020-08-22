import 'package:flutter/material.dart';
import 'package:smart_health/custom_widgets/appbar.dart';
import 'package:smart_health/custom_widgets/drawer.dart';
import 'package:smart_health/custom_widgets/emergency_float_button.dart';

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
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    "San Francisco",
                    style: TextStyle(
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
                        style: TextStyle(
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
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "Sunny",
                                style: TextStyle(
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
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "89%",
                                style: TextStyle(
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
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "5.5 km/h",
                                style: TextStyle(
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
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "6",
                                style: TextStyle(
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
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 35.0,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    "San Francisco",
                    style: TextStyle(
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
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "3.0 µg/m³",
                                style: TextStyle(
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
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "8.0 mg/m³",
                                style: TextStyle(
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
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "40.0 µg/m³",
                                style: TextStyle(
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
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "57.0 µg/m³",
                                style: TextStyle(
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
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "7.0 µg/m³",
                                style: TextStyle(
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
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "2.1 µg/m³",
                                style: TextStyle(
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
