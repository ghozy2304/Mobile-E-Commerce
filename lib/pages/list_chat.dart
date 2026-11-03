import 'package:flutter/material.dart';

class ListChatPage extends StatefulWidget {
  const ListChatPage({super.key});

  @override
  State<ListChatPage> createState() => _ListChatPage();
}

class _ListChatPage extends State<ListChatPage> {
  bool _showUnreadOnly = false;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> chats = [
      {
        'name': 'ElekShop Customer Care',
        'lastMessage': 'Pesanan elektronik Anda sedang dipacking dengan aman.',
        'time': '10.35',
        'avatarUrl': 'https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?w=150',
        'isRead': false,
      },
      {
        'name': 'Samsung Official Store',
        'lastMessage': 'Garansi resmi SEIN 1 tahun sudah otomatis aktif.',
        'time': '10.20',
        'avatarUrl': 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=150',
        'isRead': false,
      },
      {
        'name': 'Apple Authorized Reseller',
        'lastMessage': 'Unit MacBook Pro M3 Space Black siap dikirim.',
        'time': '09.45',
        'avatarUrl': 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=150',
        'isRead': true,
      },
      {
        'name': 'Sony Audio Indonesia',
        'lastMessage': 'Headphone WH-1000XM5 original garansi PT Sony Indonesia.',
        'time': 'Kemarin',
        'avatarUrl': 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=150',
        'isRead': true,
      },
      {
        'name': 'MechKeyboard Studio',
        'lastMessage': 'Switch Gateron Yellow sudah kami lube halus ya kak.',
        'time': 'Kemarin',
        'avatarUrl': 'https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=150',
        'isRead': false,
      },
      {
        'name': 'Gadget Care & Service',
        'lastMessage': 'Klaim proteksi layar gadget gratis telah berhasil didaftarkan.',
        'time': '28 Okt',
        'avatarUrl': 'https://images.unsplash.com/photo-1588508065123-287b28e013da?w=150',
        'isRead': true,
      },
    ];

    final visibleChats = _showUnreadOnly
        ? chats.where((c) => c['isRead'] == false).toList()
        : chats;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'Pesan & Diskusi',
          style: TextStyle(
            color: Color(0xFF1E293B),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF1E293B)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_rounded, color: Color(0xFF64748B)),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
            child: Row(
              children: [
                ChoiceChip(
                  label: const Text('Semua'),
                  selected: !_showUnreadOnly,
                  selectedColor: const Color(0xFF2563EB),
                  labelStyle: TextStyle(
                    color: !_showUnreadOnly ? Colors.white : const Color(0xFF475569),
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                  onSelected: (_) => setState(() => _showUnreadOnly = false),
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('Belum dibaca'),
                  selected: _showUnreadOnly,
                  selectedColor: const Color(0xFF2563EB),
                  labelStyle: TextStyle(
                    color: _showUnreadOnly ? Colors.white : const Color(0xFF475569),
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                  onSelected: (_) => setState(() => _showUnreadOnly = true),
                ),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1, color: Color(0xFFE2E8F0)),
          Expanded(
            child: ListView.separated(
              itemCount: visibleChats.length,
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                thickness: 0.5,
                indent: 72,
                color: Color(0xFFF1F5F9),
              ),
              itemBuilder: (context, index) {
                final chat = visibleChats[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  tileColor: Colors.white,
                  leading: CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(chat['avatarUrl'] as String),
                  ),
                  title: Text(
                    chat['name'] as String,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  subtitle: Text(
                    chat['lastMessage'] as String,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF64748B),
                    ),
                  ),
                  trailing: Text(
                    chat['time'] as String,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF94A3B8),
                    ),
                  ),
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/detailChat_page',
                    arguments: {'contactName': chat['name'] as String},
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
