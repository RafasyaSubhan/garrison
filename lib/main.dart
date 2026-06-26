import 'package:flutter/material.dart';

import 'constants/app_colors.dart';
import 'widgets/navbar.dart';
import 'widgets/home_header.dart';

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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              HomeHeader(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}