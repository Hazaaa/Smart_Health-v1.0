import 'package:flutter/material.dart';
import 'package:smart_health/themes/custom_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
          title: Text(
            "Smart Health",
            style: titleTextStyle(),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(Icons.notifications, color: Colors.grey, size: 30.0),
            ),
          ],
          bottom: PreferredSize(
            child: Divider(
              height: 1.0,
            ),
            preferredSize: Size.fromHeight(1.0),
          ),
        );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}