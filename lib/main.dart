// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/MyFlight.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/signUp.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Replace with your actual Firebase project configuration
  final firebaseConfig = FirebaseOptions(
    apiKey: "AIzaSyAspkUJ_FrWCRiIZ_gq8EXbAB3yNUUw7WI",
    appId: "1:519520418458:android:377e038a9eabbf58debd23",
    messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
    projectId: "lightflight-7abd4",
  );
  await Firebase.initializeApp(options: firebaseConfig);

  //firebase

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: welcomPage(),
    theme: ThemeData(
      primaryColor: Color(0xFF2F83C5),
      primaryColorLight: Color(0xFF1BAEC6),
      primaryColorDark: Color(0xFF096499),
      highlightColor: Color(0xFF48C4DD),
      scaffoldBackgroundColor: Color(0xFFF3F9FB),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Color(0xFF096499), fontSize: 16),
        bodyMedium: TextStyle(color: Color(0xFF096499), fontSize: 14),
        bodySmall: TextStyle(color: Color(0xFF2F83C5), fontSize: 12),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    routes: {
      '/login': (context) => loginPage(),
      '/signup': (context) => SignupPage(),
      // Define other routes here
    },
  ));
}

class welcomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F9FB),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/lightFlightLogo.png"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    "Welcom to LightFlight",
                    style: TextStyle(
                      color: Color(0xFF096499),
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Where Your Journey Begins!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[700], //mayby change
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  //login btn
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => loginPage()));
                    },
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),

                  //signup btn
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupPage()));
                    },
                    color: Color.fromARGB(255, 104, 204, 220),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color(0xFF1BAEC6),
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      "SignUp",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
