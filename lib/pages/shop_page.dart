import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../constants/app_assets.dart';
import '../widgets/header.dart';
import '../widgets/navbar.dart';
import '../widgets/shop_item_card.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppHeader(),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shop',
                      style: AppTextStyles.c2.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // ITEMS
                    Text(
                      'Items',
                      style: AppTextStyles.h4.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 12),

                    GridView.extent(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      maxCrossAxisExtent: 220,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.58,
                      children: const [
                        ShopItemCard(
                          title: 'Small HP',
                          description: 'Meningkatkan batas maksimal HP sebanyak +20',
                          price: 40,
                          isOneTime: true,
                          isOwned: false,
                          iconPath: AppAssets.smallHp,
                          iconPlaceholderColor: AppColors.danger,
                        ),
                        ShopItemCard(
                          title: 'Big HP',
                          description: 'Meningkatkan batas maksimal HP sebanyak +50',
                          price: 100,
                          isOneTime: true,
                          isOwned: false,
                          iconPath: AppAssets.bigHp,
                          iconPlaceholderColor: AppColors.danger,
                        ),
                        ShopItemCard(
                          title: 'Shield Potion',
                          description: 'Tahan 1x damage saat keluar aplikasi.',
                          price: 400,
                          isOneTime: false,
                          ownedCount: 0,
                          iconPath: AppAssets.shieldPotion,
                          iconPlaceholderColor: AppColors.accent,
                        ),
                        ShopItemCard(
                          title: 'Time Crystal',
                          description: 'Mencegah streak harianmu reset sebanyak 1x.',
                          price: 500,
                          isOneTime: false,
                          ownedCount: 1,
                          iconPlaceholderColor: AppColors.accent,
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // CHARACTERS
                    Text(
                      'Characters',
                      style: AppTextStyles.h4.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 12),

                    GridView.extent(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      maxCrossAxisExtent: 220,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.58,
                      children: const [
                        ShopItemCard(
                          title: 'Garry',
                          description: 'Karakter dasar untuk memulai petualanganmu.',
                          price: 0,
                          isOneTime: true,
                          isOwned: true,
                          iconPlaceholderColor: AppColors.textSecondary,
                        ),
                      ],
                    ),

                    const SizedBox(height: 36),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Navbar(
        currentIndex: 1,
      ),
    );
  }
}