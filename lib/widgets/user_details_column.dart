import 'package:flutter/material.dart';

import 'package:smart_health/themes/custom_theme.dart';

class UserDetailsColumn extends StatelessWidget {
  const UserDetailsColumn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: CircleAvatar(
            radius: 30.0,
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 30.0,
            ),
            backgroundColor: Colors.grey,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 6.0),
          child: Text(
            "Keith Scott",
            style: titleTextStyle(),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.0, bottom: 10.0),
          child: Text(
            "33 years | 90 kg | 180 cm",
            style: subtitleTextStyle(),
          ),
        )
      ],
    );
  }
}
