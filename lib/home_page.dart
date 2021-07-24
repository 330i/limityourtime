import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        title: Text('Screen Time'),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {}, // ON TAP, SEND TO THE SETTINGS PAGE
                child: Icon(
                    Icons.settings
                ),
              )
          ),
        ],
      ),

      body:
      Center(
        child: Column(
          children: [
            // HOURS
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Container(
                width: 250.0,
                height: 250.0,
                decoration: new BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Center
                  (child: Text('PUT HOURS HERE')
                ),
              ),
            ),

            // TIME LEFT UNTIL LIMIT
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 45.0),
              child: Text('X hours screen time spent before break'),
            ),

            // THIS WEEK'S AVERAGE
            Center(
              child: Row(
                children: [
                  Container(
                    height: 200,
                    width: 155,
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    margin: EdgeInsets.only(left: 37.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Text('THIS WEEK\'S AVERAGE',)
                    ),

                  ),

                  Container(padding: const EdgeInsets.symmetric(horizontal: 15.0),),

                  // THIS WEEK'S TOTAL
                  Container(
                    height: 200,
                    width: 155,
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Text('THIS WEEK\'S TOTAL')
                    ),

                  ),
                ],
              ),
            ),




          ],
        ),
      ),
    );
  }
}


