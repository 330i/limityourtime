import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:limityourtime/pages/stats_page.dart';
import 'package:limityourtime/settings/settings.dart';
import 'package:page_transition/page_transition.dart';
import 'package:validators/sanitizers.dart';

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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            DocumentSnapshot currentUserDoc = snapshot.data as DocumentSnapshot;
            return Center(
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
                                      '${toInt(currentUserDoc['weekTime'][DateTime.now().weekday-1].toString())}h',
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
                      '${toInt(((DateTime.now().millisecondsSinceEpoch-(currentUserDoc['lastStart'] as Timestamp).millisecondsSinceEpoch)/3600000).toString())} hours spent before break',
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
                                        '${(((currentUserDoc['weekTime']).reduce((a, b) => a + b)/7).toStringAsFixed(1))}hrs',
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
                                        '${currentUserDoc['weekTime'].reduce((a, b) => a + b)}hrs',
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: NeumorphicButton(
                      child: Text('More Stats'),
                      onPressed: () {
                        Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: StatsPage()));
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          else {
            return Center(
              child: Container(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
