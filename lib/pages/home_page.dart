import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:limityourtime/settings/settings.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      appBar: AppBar(
        title: Text(
          'Screen Time',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: SettingsPage()));
                }, // ON TAP, SEND TO THE SETTINGS PAGE
                child: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
              )
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            // HOURS
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Neumorphic(
                style: NeumorphicStyle(
                  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(135)),
                  depth: 4,
                  shape: NeumorphicShape.concave,
                ),
                child: Container(
                  width: 270.0,
                  height: 270.0,
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          child: CircularProgressIndicator(
                            strokeWidth: 20,
                            value: 0.8,
                            color: Color.fromRGBO(239, 83, 80, 1),
                          ),
                          width: 250,
                          height: 250,
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 75,
                          child: Column(
                            children: [
                              Text(
                                '10h',
                                style: TextStyle(
                                  fontSize: 50,
                                ),
                              ),
                              Text(
                                'Today',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // TIME LEFT UNTIL LIMIT
            Padding(
              padding: const EdgeInsets.only(top: 35.0, bottom: 8),
              child: Text(
                '6 hours spent before break',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            // THIS WEEK'S AVERAGE
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Neumorphic(
                style: NeumorphicStyle(
                  depth: 4,
                  shape: NeumorphicShape.concave,
                ),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        height: 15,
                      ),
                      Text(
                        'This Week',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Average',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Text(
                                  '20hrs',
                                  style: TextStyle(
                                    fontSize: 35,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          // THIS WEEK'S TOTAL
                          Container(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Text(
                                  '80hrs',
                                  style: TextStyle(
                                    fontSize: 35,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),




          ],
        ),
      ),
    );
  }
}
