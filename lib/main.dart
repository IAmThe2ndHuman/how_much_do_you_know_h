import 'package:flutter/material.dart';
import 'screens/welcome.dart';
import 'screens/bye.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.grey[900],
        fontFamily: "RobotoSpecial",
      ),
      routes: {
        "/": (context) => WelcomeScreen(),
        "/bye": (context) => CrashApp()
      },
      initialRoute: "/",
    );
  }
}
