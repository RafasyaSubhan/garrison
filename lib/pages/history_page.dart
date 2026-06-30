import 'package:flutter/material.dart';

import '../widgets/header.dart';
import '../widgets/navbar.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppHeader(),
          ],
        ),
      ),
      bottomNavigationBar: const Navbar(currentIndex: 2),
    );
  }
}