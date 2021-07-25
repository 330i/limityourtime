import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
class hoursInput extends StatelessWidget {
  String DisplayText;
  String limit;
  hoursInput(this.DisplayText, this.limit);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
          children: <Widget>[
            Text(
              DisplayText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Container(
              height: 50,
              width: 50,
              child: Neumorphic(
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: limit,
                    contentPadding: EdgeInsets.all(15),
                    counterText: '',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  maxLength: 2,
                ),
              ),
            )
          ]
      ),
    );
  }
}