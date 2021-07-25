import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'switch_notifications.dart';
import 'hours_input.dart';
import 'textbox.dart';

class SettingsPage extends StatelessWidget {
  bool notification=true;
  var hours = [0,0,0,0,0,0,0];
  void doNothing(){
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: 810,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height-93,
              child: ListView(
                  children: <Widget>[
                    Container(
                      height: 10,
                    ),
                    Neumorphic(
                      child: Center(
                        child: Text(
                          'Time Limit',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: 500,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: <Widget>[
                            Expanded(child: hoursInput('Monday', hours.elementAt(0).toString())),
                            Expanded(child: hoursInput('Tuesday',hours.elementAt(1).toString())),
                            Expanded(child: hoursInput('Wednesday',hours.elementAt(2).toString())),
                            Expanded(child: hoursInput('Thursday',hours.elementAt(3).toString())),
                            Expanded(child: hoursInput('Friday',hours.elementAt(4).toString())),
                            Expanded(child: hoursInput('Saturday',hours.elementAt(5).toString())),
                            Expanded(child: hoursInput('Sunday',hours.elementAt(6).toString())),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 45.0),
                      child: NeumorphicButton(
                        style: NeumorphicStyle(
                          depth: 8,
                        ),
                        onPressed: () {

                        },
                        child: Center(
                          child: Text(
                            'Save',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                    ),
                    Neumorphic(
                      child: Center(
                        child: Text(
                          'Notifications',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: SwitchNotifications('Receive Mobile Notifications'),
                          ),
                        ],
                      ),
                    )
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}