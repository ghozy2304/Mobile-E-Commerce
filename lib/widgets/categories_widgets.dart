import 'package:flutter/material.dart';

class CategoriesWidgets extends StatefulWidget {
  const CategoriesWidgets({super.key});

  @override
  State<CategoriesWidgets> createState() => _CategoriesWidgetsState();
}

class _CategoriesWidgetsState extends State<CategoriesWidgets> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _categories = const [
    {
      'title': 'Semua',
      'icon': Icons.grid_view_rounded,
      'color': Color(0xFF2563EB),
      'bg': Color(0xFFEFF6FF),
    },
    {
      'title': 'Smartphone',
      'icon': Icons.phone_android_rounded,
      'color': Color(0xFF3B82F6),
      'bg': Color(0xFFEFF6FF),
    },
    {
      'title': 'Laptop',
      'icon': Icons.laptop_mac_rounded,
      'color': Color(0xFF6366F1),
      'bg': Color(0xFFEEF2FF),
    },
    {
      'title': 'Audio & TWS',
      'icon': Icons.headphones_rounded,
      'color': Color(0xFF8B5CF6),
      'bg': Color(0xFFFAF5FF),
    },
    {
      'title': 'Smartwatch',
      'icon': Icons.watch_rounded,
      'color': Color(0xFF0D9488),
      'bg': Color(0xFFF0FDFA),
    },
    {
      'title': 'Gaming',
      'icon': Icons.sports_esports_rounded,
      'color': Color(0xFFEA580C),
      'bg': Color(0xFFFFF7ED),
    },
    {
      'title': 'Kamera',
      'icon': Icons.camera_alt_rounded,
      'color': Color(0xFFE11D48),
      'bg': Color(0xFFFFF1F2),
    },
    {
      'title': 'Tablet',
      'icon': Icons.tablet_mac_rounded,
      'color': Color(0xFF0284C7),
      'bg': Color(0xFFF0F9FF),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final cat = _categories[index];
          final isSelected = _selectedIndex == index;

          return InkWell(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            borderRadius: BorderRadius.circular(14),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF2563EB)
                    : Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF2563EB)
                      : const Color(0xFFE2E8F0),
                  width: 1,
                ),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: const Color(0xFF2563EB).withValues(alpha: 0.25),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ]
                    : [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.02),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.white.withValues(alpha: 0.2)
                          : cat['bg'] as Color,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      cat['icon'] as IconData,
                      size: 16,
                      color: isSelected
                          ? Colors.white
                          : cat['color'] as Color,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    cat['title'] as String,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                      color: isSelected
                          ? Colors.white
                          : const Color(0xFF334155),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

