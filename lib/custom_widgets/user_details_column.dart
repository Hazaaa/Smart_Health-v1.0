import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:smart_health/themes/custom_theme.dart';

class UserDetailsColumn extends StatefulWidget {
  UserDetailsColumn({Key key, this.profileDetails = false}) : super(key: key);

  final bool profileDetails;

  @override
  _UserDetailsColumnState createState() => _UserDetailsColumnState();
}

class _UserDetailsColumnState extends State<UserDetailsColumn> {
  bool _showEdit;
  double _pictureRadius;
  TextStyle _nameTextStyle;

  @override
  void initState() {
    super.initState();
    _showEdit = widget.profileDetails ? true : false;
    _pictureRadius = widget.profileDetails ? 50.0 : 30.0;
    _nameTextStyle = widget.profileDetails
        ? GoogleFonts.lato(color: Colors.black54, fontSize: 30.0)
        : GoogleFonts.lato(color: Colors.black54);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                CircleAvatar(
                  radius: _pictureRadius,
                  backgroundImage: NetworkImage(
                      "https://cdn.britannica.com/92/215392-050-96A4BC1D/Australian-actor-Chris-Hemsworth-2019.jpg"),
                  backgroundColor: Colors.grey,
                ),
                Visibility(
                  visible: _showEdit,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: IconButton(
                      color: Colors.black,
                      icon: Icon(Icons.photo_camera),
                      onPressed: () {
                        // TODO: Implement picture change
                      },
                    ),
                  ),
                ),
              ],
            )),
        Text("Keith Scott", style: _nameTextStyle),
        Visibility(
          visible: !_showEdit,
          child: Padding(
            padding: EdgeInsets.only(left: 8.0, bottom: 10.0),
            child: Text(
              "33 years | 90 kg | 180 cm",
              style: subtitleTextStyle(),
            ),
          ),
        )
      ],
    );
  }
}
