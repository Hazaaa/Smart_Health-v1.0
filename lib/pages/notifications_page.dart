import 'package:flutter/material.dart';
import 'package:smart_health/custom_widgets/appbar.dart';
import 'package:smart_health/custom_widgets/drawer.dart';
import 'package:smart_health/custom_widgets/emergency_float_button.dart';
import 'package:smart_health/routing/routes.dart';

class NotificationsPage extends StatefulWidget {
  NotificationsPage({Key key}) : super(key: key);

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  int _numberOfNotifications = 4;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: EmergencyFloatButton(),
        appBar: CustomAppBar(),
        drawer: CustomDrawer(),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 10.0),
                Text(
                  "Notifications",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 10.0),
                ListTile(
                  leading: Icon(
                    Icons.new_releases,
                    color: Colors.blue,
                  ),
                  title: Text("Check result from your last doctor visit"),
                  subtitle: Text(
                    "Date: 20/07/2020 18:55",
                    style: TextStyle(color: Colors.black54, fontSize: 12.0),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(RecordsPageRoute);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.new_releases,
                    color: Colors.blue,
                  ),
                  title: Text("New news in your region"),
                  subtitle: Text(
                    "Date: 20/07/2020 18:55",
                    style: TextStyle(color: Colors.black54, fontSize: 12.0),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(HomePageRoute);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.new_releases,
                    color: Colors.yellow,
                  ),
                  title: Text("Check temperature for today"),
                  subtitle: Text(
                    "Date: 20/07/2020 18:55",
                    style: TextStyle(color: Colors.black54, fontSize: 12.0),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(WeatherPageRoute);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
