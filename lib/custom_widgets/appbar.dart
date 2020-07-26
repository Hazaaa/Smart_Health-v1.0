import 'package:flutter/material.dart';
import 'package:smart_health/routing/routes.dart';
import 'package:smart_health/themes/custom_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.black54,
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      title: Text(
        "Smart Health",
        style: titleTextStyle(),
      ),
      centerTitle: true,
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 3.0),
            child: IconButton(
              icon: Icon(Icons.notifications_active,
                  color: Colors.red, size: 30.0),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(NotificationsPageRoute);
              },
            )),
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
