import 'package:flutter/material.dart';

class NewsWidget extends StatefulWidget {
  NewsWidget({Key key}) : super(key: key);

  @override
  _NewsWidgetState createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 9.0, left: 10.0, right: 10.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.circular(10.0)),
        child: ListView(
          children: <Widget>[
            ListTile(
              contentPadding:
                  EdgeInsets.only(top: 10.0, left: 16.0, right: 10.0),
              leading: Image(
                  image: NetworkImage(
                      "https://s.abcnews.com/images/Health/doctor-gty-er-180205_hpMain_4_16x9_992.jpg")),
              title: Text("Doctors are close to find cure for COVID 19!"),
              subtitle: Text("Tap to find out more"),
            ),
            Divider(indent: 15.0, endIndent: 15.0),
            ListTile(
              contentPadding: EdgeInsets.only(left: 16.0, right: 10.0),
              leading: Image(
                  image: NetworkImage(
                      "https://d32ijn7u0aqfv4.cloudfront.net/wp/wp-content/uploads/20181029145925/the-colourful-journey-to-red-_SLR17108_How_Student_Loan_Consolidation_Companies_Can_Help_You_Lower_Your_Interest_Rate_1045548_st_780x440.jpg")),
              title: Text("Number of COVID 19 patietns is decreasing!"),
              subtitle: Text("Tap to find out more"),
            ),
            Divider(indent: 15.0, endIndent: 15.0),
            ListTile(
              contentPadding: EdgeInsets.only(left: 16.0, right: 10.0),
              leading: Image(
                  image: NetworkImage(
                      "https://media2.fdncms.com/northcoast/imager/u/mobilestory/16847512/coronaknow.jpg")),
              title: Text("What you need to know about Corona virus..."),
              subtitle: Text("Tap to find out more"),
            ),
            Divider(indent: 15.0, endIndent: 15.0),
            ListTile(
              contentPadding: EdgeInsets.only(left: 16.0, right: 10.0),
              leading: Image(
                  image: NetworkImage(
                      "https://media2.fdncms.com/northcoast/imager/u/mobilestory/16847512/coronaknow.jpg")),
              title: Text("What you need to know about Heart diseases."),
              subtitle: Text("Tap to find out more"),
            ),
            Divider(indent: 15.0, endIndent: 15.0),
            ListTile(
              contentPadding: EdgeInsets.only(left: 16.0, right: 10.0),
              leading: Image(
                  image: NetworkImage(
                      "https://www.verywellhealth.com/thmb/5XDw8jl9EaKjU1Fjqiv8Cw4kUIc=/1500x1000/filters:no_upscale():max_bytes(150000):strip_icc()/the-best-vitamin-for-fighting-inflammation-4176859_FINAL-5c05c5f946e0fb0001fc46fb.png")),
              title: Text("What are best vitamins for you?"),
              subtitle: Text("Tap to find out more"),
            ),
            Divider(indent: 15.0, endIndent: 15.0),
            ListTile(
              contentPadding: EdgeInsets.only(left: 16.0, right: 10.0),
              leading: Image(
                  image: NetworkImage(
                      "https://ca-times.brightspotcdn.com/dims4/default/444499c/2147483647/strip/true/crop/3000x2000+0+0/resize/840x560!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F7d%2F24%2F0d9fed4c40c285ffca41843ae569%2Fdecadefood.jpg")),
              title: Text("You have to try this food!"),
              subtitle: Text("Tap to find out more"),
            )
          ],
        ),
      ),
    );
  }
}
