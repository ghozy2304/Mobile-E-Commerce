import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              // Store Logo Badge
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/elekshop_logo.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // Store Name & Greeting
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Pusat Gadget & Elektronik',
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xFF64748B),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: const [
                        Text(
                          'ElekShop',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E293B),
                            letterSpacing: -0.3,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.verified_rounded,
                          size: 16,
                          color: Color(0xFF2563EB),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Action: Chat with badge
              badges.Badge(
                position: badges.BadgePosition.topEnd(top: -4, end: -4),
                badgeStyle: const badges.BadgeStyle(
                  badgeColor: Color(0xFFE11D48),
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                ),
                badgeContent: const Text(
                  '9',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: InkWell(
                  onTap: () => Navigator.pushNamed(context, '/listChat_page'),
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.all(9),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.chat_bubble_outline_rounded,
                      size: 20,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),

              // Action: Cart Shortcut
              InkWell(
                onTap: () => Navigator.pushNamed(context, '/cart_page'),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.shopping_bag_outlined,
                    size: 20,
                    color: Color(0xFF1E293B),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

