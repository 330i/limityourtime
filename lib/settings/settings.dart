import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:validators/sanitizers.dart';
import 'switch_notifications.dart';
import 'hours_input.dart';
import 'textbox.dart';

class SettingsPage extends StatelessWidget {
  bool notification=true;
  var hours = [0,0,0,0,0,0,0];
  void doNothing(){
  }

  List<TextEditingController> weekController = [new TextEditingController(), new TextEditingController(), new TextEditingController(), new TextEditingController(), new TextEditingController(), new TextEditingController(), new TextEditingController(), new TextEditingController()];

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
      body: StreamBuilder<Object>(
        stream: FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            DocumentSnapshot currentUserDoc = snapshot.data as DocumentSnapshot;
            for(int i=0;i<7;i++) {
              weekController[i] = TextEditingController(text: currentUserDoc['weekLimit'][i].toString());
            }
            return Container(
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
                                'Time Limit Before Break',
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
                                  Expanded(child: hoursInput('Monday', hours.elementAt(0).toString(), weekController[0])),
                                  Expanded(child: hoursInput('Tuesday',hours.elementAt(1).toString(), weekController[1])),
                                  Expanded(child: hoursInput('Wednesday',hours.elementAt(2).toString(), weekController[2])),
                                  Expanded(child: hoursInput('Thursday',hours.elementAt(3).toString(), weekController[3])),
                                  Expanded(child: hoursInput('Friday',hours.elementAt(4).toString(), weekController[4])),
                                  Expanded(child: hoursInput('Saturday',hours.elementAt(5).toString(), weekController[5])),
                                  Expanded(child: hoursInput('Sunday',hours.elementAt(6).toString(), weekController[6])),
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
                                List<int> limits = [];
                                for(int i=0;i<7;i++) {
                                  if(weekController[i].text=='') {
                                    limits.add(0);
                                  }
                                  else {
                                    limits.add(toInt(weekController[i].text).toInt());
                                  }
                                }
                                FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).update({
                                  'weekLimit': limits,
                                });
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