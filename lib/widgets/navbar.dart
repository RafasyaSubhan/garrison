import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/app_colors.dart';
import '../constants/app_assets.dart';
import '../constants/app_text_styles.dart';

import '../pages/home_page.dart';
import '../pages/shop_page.dart';
import '../pages/history_page.dart';
import '../pages/profile_page.dart';

class Navbar extends StatelessWidget {
  final int currentIndex;

  const Navbar({
    super.key,
    required this.currentIndex,
  });

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
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(context, iconPath: AppAssets.home, label: 'Home', index: 0),
          _buildNavItem(context, iconPath: AppAssets.shop, label: 'Shop', index: 1),
          _buildNavItem(context, iconPath: AppAssets.history, label: 'History', index: 2),
          _buildNavItem(context, iconPath: AppAssets.profile, label: 'Profile', index: 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(
      BuildContext context, {
        required String iconPath,
        required String label,
        required int index,
      }) {
    final bool isActive = currentIndex == index;

    final Color currentColor =
    isActive ? AppColors.textPrimary : AppColors.textSecondary;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (isActive) return;

        Widget targetPage;
        switch (index) {
          case 1:
            targetPage = const ShopPage();
            break;
          case 2:
            targetPage = const HistoryPage();
            break;
          case 3:
            targetPage = const ProfilePage();
            break;
          case 0:
          default:
            targetPage = const HomePage();
            break;
        }

        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => targetPage,
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
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