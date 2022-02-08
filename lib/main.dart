import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:registerlogin/Screen/Phone_Authetication.dart';
import 'package:registerlogin/Screen/boarding_screen.dart';
import 'package:registerlogin/Screen/login_screen.dart';
import 'package:registerlogin/Screen/leaderboard_screen.dart';
import 'package:registerlogin/Screen/view_user_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PHI SECURE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: phone_auth(),
    );
  }
}
