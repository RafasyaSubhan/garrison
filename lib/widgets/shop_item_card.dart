import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garrison/constants/app_assets.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class ShopItemCard extends StatelessWidget {
  final String title;
  final String description;
  final int price;
  final bool isOneTime;
  final bool isOwned;
  final int ownedCount;
  final Color iconPlaceholderColor;
  final String? iconPath;

  const ShopItemCard({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    this.isOneTime = true,
    this.isOwned = false,
    this.ownedCount = 0,
    required this.iconPlaceholderColor,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    final Color cardBorderColor = (isOneTime && isOwned) ? AppColors.success : AppColors.backgroundSurface;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundBase,
        border: Border.all(color: cardBorderColor),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // Icon + Badge
          Container(
            width: double.infinity,
            height: 110,
            decoration: const BoxDecoration(
              color: AppColors.backgroundElevated,
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (iconPath != null)
                  SvgPicture.asset(
                    iconPath!,
                    height: 58,
                  )
                else
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: iconPlaceholderColor.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.science, color: iconPlaceholderColor, size: 24),
                  ),

                if (!isOneTime)
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: ownedCount == 0 ? AppColors.backgroundElevated : AppColors.backgroundSurface,
                        border: Border.all(
                          color: ownedCount == 0 ? AppColors.backgroundSurface : AppColors.textSecondary,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'x$ownedCount',
                        style: AppTextStyles.p7.copyWith(
                          color: ownedCount == 0 ? AppColors.textSecondary : AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // Deskripsi dan Tombol Beli
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppTextStyles.h5.copyWith(color: AppColors.textPrimary)),
                  const SizedBox(height: 4),
                  Text(description, maxLines: 2, overflow: TextOverflow.ellipsis, style: AppTextStyles.p7.copyWith(color: AppColors.textSecondary, height: 1.2)),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppAssets.coin,
                        width: 14,
                        height: 14,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        price == 0 ? 'Free' : price.toString(),
                        style: AppTextStyles.h6.copyWith(
                          color: AppColors.gold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(height: 1, width: double.infinity, color: AppColors.backgroundSurface),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundBase,
                      border: Border.all(color: (isOneTime && isOwned) ? AppColors.backgroundSurface : AppColors.textSecondary),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      (isOneTime && isOwned) ? 'Owned' : 'Beli',
                      style: AppTextStyles.h6.copyWith(color: (isOneTime && isOwned) ? AppColors.textSecondary : AppColors.textPrimary),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}