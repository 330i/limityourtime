import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:validators/sanitizers.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {

  int selectedDay = DateTime.now().weekday;

  dayOfWeek(int day) {
    switch (day) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return 'Current';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stats',
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
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: StreamBuilder<Object>(
        stream: FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            DocumentSnapshot currentUserDoc = snapshot.data as DocumentSnapshot;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Container(
                    height: 225,
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        maxY: 24,
                        barTouchData: BarTouchData(
                          touchCallback: (response) {
                            setState(() {
                              selectedDay = response.spot!.touchedBarGroupIndex+1;
                            });
                          },
                          touchTooltipData: BarTouchTooltipData(
                            tooltipBgColor: Colors.transparent,
                            tooltipPadding: const EdgeInsets.all(0),
                            tooltipMargin: 8,
                            getTooltipItem: (
                                BarChartGroupData group,
                                int groupIndex,
                                BarChartRodData rod,
                                int rodIndex,
                                ) {
                              return BarTooltipItem(
                                rod.y.round().toString(),
                                TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                          ),
                        ),
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: SideTitles(
                            showTitles: true,
                            getTextStyles: (value) => const TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            margin: 20,
                            getTitles: (double value) {
                              switch (value.toInt()) {
                                case 0:
                                  return 'M';
                                case 1:
                                  return 'T';
                                case 2:
                                  return 'W';
                                case 3:
                                  return 'T';
                                case 4:
                                  return 'F';
                                case 5:
                                  return 'S';
                                case 6:
                                  return 'S';
                                default:
                                  return '';
                              }
                            },
                          ),
                          leftTitles: SideTitles(showTitles: false),
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        barGroups: [
                          BarChartGroupData(
                            x: 0,
                            barRods: [
                              BarChartRodData(y: toDouble(currentUserDoc['weekTime'][0].toString()), colors: [selectedDay!=1 ? Color.fromRGBO(239, 83, 80, 1) : Colors.blueAccent])
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 1,
                            barRods: [
                              BarChartRodData(y: toDouble(currentUserDoc['weekTime'][1].toString()), colors: [selectedDay!=2 ? Color.fromRGBO(239, 83, 80, 1) : Colors.blueAccent])
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 2,
                            barRods: [
                              BarChartRodData(y: toDouble(currentUserDoc['weekTime'][2].toString()), colors: [selectedDay!=3 ? Color.fromRGBO(239, 83, 80, 1) : Colors.blueAccent])
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 3,
                            barRods: [
                              BarChartRodData(y: toDouble(currentUserDoc['weekTime'][3].toString()), colors: [selectedDay!=4 ? Color.fromRGBO(239, 83, 80, 1) : Colors.blueAccent])
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 4,
                            barRods: [
                              BarChartRodData(y: toDouble(currentUserDoc['weekTime'][4].toString()), colors: [selectedDay!=5 ? Color.fromRGBO(239, 83, 80, 1) : Colors.blueAccent])
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 5,
                            barRods: [
                              BarChartRodData(y: toDouble(currentUserDoc['weekTime'][5].toString()), colors: [selectedDay!=6 ? Color.fromRGBO(239, 83, 80, 1) : Colors.blueAccent])
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 6,
                            barRods: [
                              BarChartRodData(y: toDouble(currentUserDoc['weekTime'][6].toString()), colors: [selectedDay!=7 ? Color.fromRGBO(239, 83, 80, 1) : Colors.blueAccent])
                            ],
                            showingTooltipIndicators: [0],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
                                      '${dayOfWeek(selectedDay==DateTime.now().weekday ? 0 : selectedDay)}',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Text(
                                      '${toInt(currentUserDoc['weekTime'][selectedDay-1].toString())}hrs',
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
                                      'Breaks',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Text(
                                      '${currentUserDoc['breaks'][selectedDay-1].toString()} times',
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