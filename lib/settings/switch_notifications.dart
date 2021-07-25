import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SwitchNotifications extends StatefulWidget {
  String displayText;
  SwitchNotifications(this.displayText);
  @override
  _SwitchNotificationsState createState() => _SwitchNotificationsState(displayText);
}
class _SwitchNotificationsState extends State<SwitchNotifications> {
  bool notificationsOn=true;
  String displayText;
  _SwitchNotificationsState(this.displayText);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          NeumorphicSwitch(
            height: 28,
            value: notificationsOn,
            onChanged:  (value) {
              setState(() {
                notificationsOn = value;
              }
              );
            },
          ),
          Container(
            width: 10,
          ),
          Text(
            displayText,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}