import 'package:e_commerce_app/widgets/categories_widgets.dart';
import 'package:e_commerce_app/widgets/home_appbar.dart';
import 'package:e_commerce_app/widgets/items_widgets.dart';
import 'package:flutter/material.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        // 1. Sleek Modern AppBar
        const HomeAppbar(),

        const SizedBox(height: 12),

        // 2. Modern Search Bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE2E8F0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.search_rounded,
                  size: 22,
                  color: Color(0xFF94A3B8),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Cari smartphone, laptop, TWS, audio...',
                      hintStyle: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF94A3B8),
                      ),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF6FF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.tune_rounded,
                    size: 18,
                    color: Color(0xFF2563EB),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        // 3. Hero Promo Banner (Soft & Elegant)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF1E293B), Color(0xFF2563EB)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF2563EB).withValues(alpha: 0.2),
                  blurRadius: 18,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Stack(
              children: [
                // Decorative soft translucent elements
                Positioned(
                  right: -25,
                  bottom: -35,
                  child: Container(
                    width: 125,
                    height: 125,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withValues(alpha: 0.08),
                    ),
                  ),
                ),
                Positioned(
                  right: 45,
                  top: -20,
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withValues(alpha: 0.05),
                    ),
                  ),
                ),

                // Banner Content
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Elegant Frosted Glass Badge (No Yellow)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.18),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.25),
                          width: 0.8,
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.auto_awesome_rounded,
                            size: 13,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'MEGA GADGET SALE',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              letterSpacing: 0.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Headline
                    const Text(
                      'Pesta Gadget & Diskon s/d 70%',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: -0.2,
                      ),
                    ),
                    const SizedBox(height: 4),

                    // Subtitle
                    const Text(
                      'Garansi resmi, cicilan 0% & gratis ongkir seluruh Indonesia',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFFE2E8F0),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Call To Action Button
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.06),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            'Jelajahi Sekarang',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1E293B),
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 14,
                            color: Color(0xFF1E293B),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 20),

        // 4. Section Header: Kategori Pilihan
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Kategori Pilihan',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                  letterSpacing: -0.2,
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  'Lihat Semua',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2563EB),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        // 5. Categories Slider
        const CategoriesWidgets(),

        const SizedBox(height: 20),

        // 6. Section Header: Rekomendasi Produk
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Text(
                    'Rekomendasi Produk',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                      letterSpacing: -0.2,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.auto_awesome_rounded,
                    color: Color(0xFF2563EB),
                    size: 18,
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Terpopuler',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2563EB),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 6),

        // 7. Grid Produk
        const ItemsWidgets(),

        // Extra spacing agar tidak tertutup bottom navigation bar
        const SizedBox(height: 24),
      ],
    );
  }
}

