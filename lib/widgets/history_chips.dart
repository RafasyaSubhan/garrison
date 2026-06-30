import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class HistoryChips extends StatefulWidget {
  const HistoryChips({super.key});

  @override
  State<HistoryChips> createState() => _HistoryChipsState();
}

class _HistoryChipsState extends State<HistoryChips> {
  final List<String> filters = ['Semua', 'Minggu Ini', 'Bulan Ini', 'Tahun Ini'];
  String activeFilter = 'Semua';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: filters.map((filter) {
          final bool isActive = activeFilter == filter;

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  activeFilter = filter;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: isActive ? AppColors.goldDark : AppColors.backgroundSurface,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: AppColors.backgroundElevated,
                    width: 1,
                  ),
                ),
                child: Text(
                  filter,
                  style: AppTextStyles.s6.copyWith(
                    color: isActive ? AppColors.backgroundBase : AppColors.textPrimary,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}