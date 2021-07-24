import 'dart:html';
import 'main.dart';
import 'package:flutter/material.dart';
class switchNotifications extends StatefulWidget {
  String displayText;
  switchNotifications(this.displayText);
  @override
  _switchNotificationsState createState() => _switchNotificationsState(displayText);
}
class _switchNotificationsState extends State<switchNotifications> {
  bool notificationsOn=true;
  String displayText;
  _switchNotificationsState(this.displayText);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Text(displayText),
          Switch(value: notificationsOn,
              onChanged:  (value) {
              setState(() {
              notificationsOn = value;
            }
            );
          },
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,
          )
        ],
      ),
    );
  }
}
