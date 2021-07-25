import 'package:flutter/material.dart';
class textBox extends StatelessWidget {
  final String textDisplay;
  textBox(this.textDisplay);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
      ),
      child: Text(textDisplay,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}