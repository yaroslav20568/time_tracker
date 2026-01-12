import 'package:flutter/material.dart';
import 'package:time_tracker/screens/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Tracker',
      theme: ThemeData(useMaterial3: true),
      home: const TimeTrackerScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
