import 'package:flutter/material.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: MediaQuery.of(context).size.width * 0.85,
      padding: EdgeInsets.only(left: 15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), color: Colors.blue),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.wb_sunny,
            color: Colors.yellow,
            size: 50.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, bottom: 5.0),
            child: Text(
              "San Francisco",
              style: TextStyle(color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.w700)
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05, bottom: 2.0),
            child: Text(
              "32°C",
              style: TextStyle(color: Colors.white, fontSize: 23.0, fontWeight: FontWeight.w700)
            ),
          )
        ],
      ),
    );
  }
}
