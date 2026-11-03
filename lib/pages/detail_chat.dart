import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String contactName;

  const ChatScreen({super.key, required this.contactName});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> messages = [
    {
      'sender': 'Customer Service',
      'message': 'Halo! Selamat datang di ElekShop Official Store. Semua produk dijamin 100% original & bergaransi resmi.',
      'isMe': false,
      'time': '10:28',
    },
    {
      'sender': 'Customer Service',
      'message': 'Stok produk elektronik ini siap kirim. Ada promo gratis proteksi gadget & cicilan 0% hari ini!',
      'isMe': false,
      'time': '10:29',
    },
    {
      'sender': 'You',
      'message': 'Halo kak, apakah barangnya bergaransi resmi Indonesia dan pengiriman menggunakan bubble wrap tebal?',
      'isMe': true,
      'time': '10:30',
    },
    {
      'sender': 'Customer Service',
      'message': 'Pasti kak! Dijamin garansi resmi dan paket dipacking ekstra aman dengan bubble wrap + asuransi pengiriman 😊',
      'isMe': false,
      'time': '10:31',
    },
  ];

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      messages.add({
        'sender': 'You',
        'message': text,
        'isMe': true,
        'time': 'Sekarang',
      });
      _messageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xFF1E293B),
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 19,
                  backgroundColor: const Color(0xFFEFF6FF),
                  child: Text(
                    widget.contactName.isNotEmpty
                        ? widget.contactName[0].toUpperCase()
                        : 'A',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2563EB),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: const Color(0xFF10B981),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.contactName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  const Text(
                    'Online',
                    style: TextStyle(
                      fontSize: 11,
                      color: Color(0xFF10B981),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.more_vert_rounded,
              color: Color(0xFF64748B),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const Divider(height: 1, thickness: 1, color: Color(0xFFE2E8F0)),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isMe = message['isMe'] == true;

                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.76,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: isMe ? const Color(0xFF2563EB) : Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(16),
                        topRight: const Radius.circular(16),
                        bottomLeft: Radius.circular(isMe ? 16 : 4),
                        bottomRight: Radius.circular(isMe ? 4 : 16),
                      ),
                      border: isMe
                          ? null
                          : Border.all(color: const Color(0xFFE2E8F0)),
                      boxShadow: [
                        BoxShadow(
                          color: isMe
                              ? const Color(0xFF2563EB).withValues(alpha: 0.15)
                              : Colors.black.withValues(alpha: 0.03),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: isMe
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Text(
                          message['message']!,
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.35,
                            color: isMe ? Colors.white : const Color(0xFF1E293B),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          message['time'] ?? '',
                          style: TextStyle(
                            fontSize: 10,
                            color: isMe
                                ? Colors.white.withValues(alpha: 0.75)
                                : const Color(0xFF94A3B8),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Message Input Field
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 10,
                  offset: const Offset(0, -3),
                ),
              ],
            ),
            child: SafeArea(
              top: false,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.add_photo_alternate_outlined,
                        color: Color(0xFF64748B),
                        size: 20,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      height: 44,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: TextField(
                        controller: _messageController,
                        decoration: const InputDecoration(
                          hintText: 'Tulis pesan...',
                          hintStyle: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF94A3B8),
                          ),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 12),
                        ),
                        onSubmitted: (_) => _sendMessage(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: _sendMessage,
                    child: Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2563EB),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF2563EB).withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.send_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
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

