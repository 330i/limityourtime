import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:limityourtime/pages/stats_page.dart';
import 'login/signin.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StatsPage(),
    );
  }
}
