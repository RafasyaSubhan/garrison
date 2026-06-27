import 'package:flutter/material.dart';
import 'constants/app_colors.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const GarrisonApp());
}

class GarrisonApp extends StatelessWidget {
  const GarrisonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Garrison',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundBase,
      ),
      home: const HomePage(),
    );
  }
}