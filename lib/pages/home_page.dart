import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../widgets/navbar.dart';
import '../widgets/home_header.dart';
import '../widgets/streak_card.dart';
import '../widgets/mode_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeHeader(),
                const SizedBox(height: 20),

                const StreakCard(),
                const SizedBox(height: 24),

                Text(
                  'PILIH MODE',
                  style: AppTextStyles.h5.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),

                const SizedBox(height: 16),

                const ModeCard(
                  title: 'DUNGEON',
                  description: 'Belajar dengan timer',
                ),

                const SizedBox(height: 20),

                const ModeCard(
                  title: 'CAMPFIRE',
                  description: 'Belajar santai dan fleksibel',
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const Navbar(currentIndex: 0),
    );
  }
}