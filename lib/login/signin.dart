import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:limityourtime/login/signup.dart';
import 'package:limityourtime/pages/home_page.dart';
import 'package:page_transition/page_transition.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 2*MediaQuery.of(context).size.height/5,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width-60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(
                          flex: 1,
                        ),
                        Text(
                          'Welcome',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Neumorphic(
                style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.email_outlined,
                        size: 25,
                        color: Colors.black54,
                      ),
                      Container(
                        width: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width-111,
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 28,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Neumorphic(
                style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.vpn_key_outlined,
                        size: 25,
                        color: Colors.black54,
                      ),
                      Container(
                        width: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width-111,
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Spacer(
                  flex: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: NeumorphicButton(
                    style: NeumorphicStyle(
                      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                      color: Color.fromRGBO(239, 83, 80, 1),
                    ),
                    child: Container(
                      width: 90,
                      height: 33,
                      child: Row(
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
                      FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value) {
                        Navigator.of(context).pushAndRemoveUntil(CupertinoPageRoute(builder: (context) => HomePage()),ModalRoute.withName('/login'));
                      });
                    },
                  ),
                ),
              ],
            ),
            Spacer(
              flex: 1,
            ),
            Row(
              children: [
                Spacer(
                  flex: 1,
                ),
                Text('Don\'t have an account?'),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Signup()));
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Color.fromRGBO(239, 83, 80, 1),
                    ),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
