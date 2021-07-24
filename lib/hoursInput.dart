import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class hoursInput extends StatelessWidget {
  String DisplayText;
  String limit;
  hoursInput(this.DisplayText, this.limit);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(DisplayText, textAlign: TextAlign.center),
            TextField(
              textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  hintText: limit,
                  contentPadding: EdgeInsets.all(18),
                  fillColor: Colors.orangeAccent,
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ]
            )
      ]
      ),
        );
  }
}
