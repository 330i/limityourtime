import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: emailController,
            ),
            TextField(
              controller: passwordController,
            ),
            TextButton(
              child: Text('login'),
              onPressed: () {
                FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value) {
                  FirebaseFirestore.instance.collection('users').doc(value.user!.uid).set({
                    'consecutiveTime': 0,
                    'todayTime': 0,
                    'uid': value.user!.uid,
                    'weekTime': null,
                  });
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
