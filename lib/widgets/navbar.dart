import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/app_colors.dart';
import '../constants/app_assets.dart';
import '../constants/app_text_styles.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 24,
        left: 44,
        right: 44,
        bottom: 36,
      ),
      decoration: BoxDecoration(
        color: AppColors.backgroundElevated,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(
            iconPath: AppAssets.home,
            label: 'Home',
            index: 0,
          ),
          _buildNavItem(
            iconPath: AppAssets.shop,
            label: 'Shop',
            index: 1,
          ),
          _buildNavItem(
            iconPath: AppAssets.history,
            label: 'History',
            index: 2,
          ),
          _buildNavItem(
            iconPath: AppAssets.profile,
            label: 'Profile',
            index: 3,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required String iconPath,
    required String label,
    required int index,
  }) {
    final bool isActive = selectedIndex == index;

    final Color currentColor =
    isActive ? AppColors.textPrimary : AppColors.textSecondary;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 28,
            height: 28,
            colorFilter: ColorFilter.mode(
              currentColor,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTextStyles.c6.copyWith(
              color: currentColor,
            ),
          ),
        ],
      ),
    );
  }
}