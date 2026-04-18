import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'constants.dart';

void main() {
  runApp(const PharmacareApp());
}

class PharmacareApp extends StatelessWidget {
  const PharmacareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pharmacare',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
