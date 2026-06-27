import 'package:flutter/material.dart';

import 'constants/app_colors.dart';
import 'constants/app_text_styles.dart';
import 'widgets/navbar.dart';
import 'widgets/home_header.dart';
import 'widgets/streak_card.dart';
import 'widgets/mode_card.dart';

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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeHeader(),
                SizedBox(height: 20),

                StreakCard(),
                SizedBox(height: 24),

                Text(
                  'PILIH MODE',
                  style: AppTextStyles.h5.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),

                SizedBox(height: 16),

                ModeCard(
                  title: 'DUNGEON',
                  description: 'Belajar dengan timer',
                ),

                SizedBox(height: 16),

                ModeCard(
                  title: 'CAMPFIRE',
                  description: 'Belajar santai dan fleksibel',
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}