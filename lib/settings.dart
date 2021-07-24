import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'hoursInput.dart';
import 'textBox.dart';
import 'switchNotifications.dart';
import 'dart:convert';
class SettingsPage extends StatelessWidget {
  bool notification=true;
  var hours = [0,0,0,0,0,0,0];
  void doNothing(){
  }
  @override
  Widget build(BuildContext context) {
    return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              textBox('Set Screen Time Limit'),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(child: hoursInput('Monday', hours.elementAt(0).toString())),
                    Expanded(child: hoursInput('Tuesday',hours.elementAt(1).toString())),
                    Expanded(child: hoursInput('Wednesday',hours.elementAt(2).toString()))
                  ]
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(child: hoursInput('Thursday',hours.elementAt(3).toString())),
                  Expanded(child: hoursInput('Friday',hours.elementAt(4).toString())),
                  Expanded(child: hoursInput('Saturday',hours.elementAt(5).toString()))
                ]
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(child: FractionallySizedBox(
                      widthFactor: .33,
                        child: hoursInput('Sunday',hours.elementAt(6).toString())
                    )
                    )
                    ]
              ),
              ElevatedButton(onPressed: doNothing, child: Text('Submit')),
              textBox('Notification Settings'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  switchNotifications('Receive Mobile Notifications'),
                  switchNotifications('Receive Laptop Notifications'),
                ],
              )
                  ]
              ),
            );
  }
}
