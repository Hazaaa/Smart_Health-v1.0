import 'package:flutter/material.dart';

class EmergencyFloatButton extends StatelessWidget {
  const EmergencyFloatButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.red,
      tooltip: "Emergency contact",
      child: Icon(
        Icons.phone,
        color: Colors.white,
      ),
      onPressed: () {
        // TODO: OPEN EMERGENCY MODAL
      },
    );
  }
}
