import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class StreakCard extends StatelessWidget {
  const StreakCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: AppColors.backgroundSurface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Halo, Rafa!',
                  style: AppTextStyles.c6.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),

                const SizedBox(height: 7),

                Text(
                  '7 Hari Berurut-turut!',
                  style: AppTextStyles.h4.copyWith(
                    color: AppColors.gold,
                  ),
                ),

                Text(
                  'Total minggu ini: 4 Jam 20 Menit',
                  style: AppTextStyles.p6.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          InkWell(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  'Lihat',
                  style: AppTextStyles.s6.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),

                const SizedBox(width: 4),

                const Icon(
                  Icons.chevron_right,
                  size: 16,
                  color: AppColors.textPrimary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}