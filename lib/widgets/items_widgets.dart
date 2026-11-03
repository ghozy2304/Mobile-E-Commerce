import 'package:flutter/material.dart';

class ItemsWidgets extends StatefulWidget {
  const ItemsWidgets({super.key});

  @override
  State<ItemsWidgets> createState() => _ItemsWidgetsState();
}

class _ItemsWidgetsState extends State<ItemsWidgets> {
  // Data Produk Elektronik ElekShop
  final List<Map<String, dynamic>> _electronicsProducts = const [
    {
      'title': 'Galaxy Ultra 5G Titanium',
      'desc': 'Snapdragon 8 Gen 3 • 512GB',
      'price': 'Rp 18.999.000',
      'discount': '-15%',
      'image': 'assets/images/smartphone.jpg',
      'rating': '4.9',
    },
    {
      'title': 'MacBook Pro M3 Max 16"',
      'desc': '36GB RAM • 1TB SSD Space Black',
      'price': 'Rp 34.499.000',
      'discount': '-10%',
      'image': 'assets/images/laptop.jpg',
      'rating': '5.0',
    },
    {
      'title': 'Sony WH-1000XM5 ANC',
      'desc': 'Hi-Res Audio • 30h Battery',
      'price': 'Rp 4.799.000',
      'discount': '-25%',
      'image': 'assets/images/headphones.jpg',
      'rating': '4.8',
    },
    {
      'title': 'Watch Ultra AMOLED Titan',
      'desc': 'Dual GPS • ECG • Water 50m',
      'price': 'Rp 2.899.000',
      'discount': '-30%',
      'image': 'assets/images/smartwatch.jpg',
      'rating': '4.7',
    },
    {
      'title': 'Mech Pro RGB Custom 75%',
      'desc': 'Gateron Switch • Wireless BT',
      'price': 'Rp 1.250.000',
      'discount': '-40%',
      'image': 'assets/images/keyboard.jpg',
      'rating': '4.9',
    },
    {
      'title': 'Aura Pods Pro ANC Hi-Fi',
      'desc': 'Spatial Audio • Wireless Case',
      'price': 'Rp 1.499.000',
      'discount': '-35%',
      'image': 'assets/images/tws_earbuds.jpg',
      'rating': '4.8',
    },
    {
      'title': 'Alpha 7 IV Mirrorless Kit',
      'desc': '33MP Full-Frame • 4K 60p FE',
      'price': 'Rp 29.999.000',
      'discount': '-12%',
      'image': 'assets/images/camera.jpg',
      'rating': '5.0',
    },
    {
      'title': 'Pad Pro 11" Liquid Retina',
      'desc': '256GB Wi-Fi + Stylus Included',
      'price': 'Rp 13.799.000',
      'discount': '-18%',
      'image': 'assets/images/tablet.jpg',
      'rating': '4.9',
    },
  ];

  // State untuk Favorite per item
  late List<bool> isFavoriteList;

  // Tema Warna
  static const Color primaryColor = Color(0xFF2563EB); // Royal Blue
  static const Color textColor = Color(0xFF1E293B);
  static const Color subtitleColor = Color(0xFF64748B);

  @override
  void initState() {
    super.initState();
    isFavoriteList = List.generate(
      _electronicsProducts.length,
      (index) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.60,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      itemCount: _electronicsProducts.length,
      itemBuilder: (context, i) {
        final product = _electronicsProducts[i];

        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Badge Diskon & Tombol Favorite
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Badge Diskon
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFDCFCE7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      product['discount'] as String,
                      style: const TextStyle(
                        color: Color(0xFF16A34A),
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ),
                  ),

                  // Tombol Favorite Interaktif
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavoriteList[i] = !isFavoriteList[i];
                      });
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            isFavoriteList[i]
                                ? '${product['title']} ditambahkan ke Favorit'
                                : '${product['title']} dihapus dari Favorit',
                          ),
                          behavior: SnackBarBehavior.floating,
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isFavoriteList[i]
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded,
                        color: isFavoriteList[i]
                            ? Colors.redAccent
                            : subtitleColor,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // 2. Gambar Produk Elektronik
              Center(
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    height: 105,
                    width: double.infinity,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8FAFC),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        product['image'] as String,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey.shade200,
                            child: const Icon(
                              Icons.devices_rounded,
                              color: subtitleColor,
                              size: 32,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // 3. Nama Produk
              Tooltip(
                message: product['title'] as String,
                child: Text(
                  product['title'] as String,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ),

              const SizedBox(height: 2),

              // 4. Spesifikasi Singkat
              Text(
                product['desc'] as String,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 11, color: subtitleColor),
              ),

              const SizedBox(height: 4),

              // Rating Row
              Row(
                children: [
                  const Icon(
                    Icons.star_rounded,
                    size: 15,
                    color: Color(0xFFF59E0B),
                  ),
                  const SizedBox(width: 3),
                  Text(
                    product['rating'] as String,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    '• Garansi Resmi',
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFF10B981),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              const Spacer(),

              // 5. Harga & Tombol Tambah ke Keranjang
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      product['price'] as String,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ),

                  // Tombol Cart
                  Material(
                    color: primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${product['title']} dimasukkan ke keranjang!',
                            ),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: primaryColor,
                            duration: const Duration(seconds: 1),
                            action: SnackBarAction(
                              label: 'Lihat',
                              textColor: Colors.white,
                              onPressed: () {
                                Navigator.pushNamed(context, '/cart_page');
                              },
                            ),
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(7.0),
                        child: Icon(
                          Icons.add_shopping_cart_rounded,
                          color: primaryColor,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
