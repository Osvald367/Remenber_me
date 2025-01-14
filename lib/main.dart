import 'package:flutter/material.dart';
import 'package:remenber_me/slashscreens/startup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Remenber Me',
      home: StartupScreen(), // Add the 'home:' keyword here
    );
  }
}
