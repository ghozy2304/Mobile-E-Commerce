import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_commerce_app/pages/home_page_content.dart';
import 'package:flutter/material.dart';

import 'cart_page.dart';
import 'account_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: const [
          HomePageContent(),
          CartPage(),
          AccountPage(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color(0xFFF8FAFC),
        color: Colors.white,
        buttonBackgroundColor: const Color(0xFF2563EB),
        height: 65,
        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.easeInOutCubic,
        index: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        items: [
          Icon(
            Icons.home_rounded,
            size: 26,
            color: _currentIndex == 0 ? Colors.white : const Color(0xFF64748B),
          ),
          Icon(
            Icons.shopping_cart_rounded,
            size: 26,
            color: _currentIndex == 1 ? Colors.white : const Color(0xFF64748B),
          ),
          Icon(
            Icons.person_rounded,
            size: 26,
            color: _currentIndex == 2 ? Colors.white : const Color(0xFF64748B),
          ),
        ],
      ),
    );
  }
}
