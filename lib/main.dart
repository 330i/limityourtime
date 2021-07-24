import 'package:flutter/material.dart';
import 'settings.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(//base page design
        appBar: AppBar(title: Text('Settings Page Test'),),
        body: SettingsPage(),
    ));
  }
}

