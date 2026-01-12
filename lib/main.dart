import 'package:flutter/material.dart';
import 'package:time_tracker/constants/index.dart';
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
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          surface: AppColors.surface,
          error: AppColors.error,
        ),
        scaffoldBackgroundColor: AppColors.background,
        cardColor: AppColors.surface,
        useMaterial3: true,
      ),
      home: const TimeTrackerScreen(),
    );
  }
}
