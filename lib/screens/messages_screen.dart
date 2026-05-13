import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> _chats = [
    {
      'storeName': 'Tech Haven Official',
      'lastMessage': 'Yes, the warranty is valid for 1 year.',
      'time': '10:42 AM',
      'unread': 2,
      'isOnline': true,
      'icon': Icons.computer,
    },
    {
      'storeName': 'Fashion Forward',
      'lastMessage': 'Your order has been shipped!',
      'time': 'Yesterday',
      'unread': 0,
      'isOnline': false,
      'icon': Icons.checkroom,
    },
    {
      'storeName': 'Home & Living',
      'lastMessage': 'Thanks for your review.',
      'time': 'Mon',
      'unread': 0,
      'isOnline': true,
      'icon': Icons.weekend,
    },
  ];

  final List<Map<String, dynamic>> _notifications = [
    {
      'title': 'Order Delivered 🎉',
      'message': 'Your package from Tech Haven has been delivered. Leave a review!',
      'time': 'Just now',
      'icon': Icons.local_shipping,
      'color': const Color(0xFF10B981),
    },
    {
      'title': 'Flash Sale Started!',
      'message': 'Hurry! Up to 50% off on premium electronics.',
      'time': '2 hours ago',
      'icon': Icons.flash_on,
      'color': const Color(0xFFF48221),
    },
    {
      'title': 'Welcome to Kharid Do',
      'message': 'Here is a \$5 voucher for your first purchase.',
      'time': '3 days ago',
      'icon': Icons.card_giftcard,
      'color': const Color(0xFF3B82F6),
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Inbox',
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Color(0xFF0F172A)),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Color(0xFF0F172A)),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: TabBar(
            controller: _tabController,
            indicatorColor: const Color(0xFFF48221),
            indicatorWeight: 3,
            labelColor: const Color(0xFFF48221),
            unselectedLabelColor: const Color(0xFF64748B),
            labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            tabs: const [
              Tab(text: 'Chats'),
              Tab(text: 'Notifications'),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildChatsList(),
          _buildNotificationsList(),
        ],
      ),
    );
  }

  Widget _buildChatsList() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: _chats.length,
      separatorBuilder: (context, index) => const Divider(
        color: Color(0xFFF1F5F9),
        height: 1,
        indent: 76,
      ),
      itemBuilder: (context, index) {
        final chat = _chats[index];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          leading: Stack(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Center(
                  child: Icon(chat['icon'] as IconData, color: const Color(0xFF94A3B8)),
                ),
              ),
              if (chat['isOnline'])
                Positioned(
                  bottom: 2,
                  right: 2,
                  child: Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: const Color(0xFF10B981),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
            ],
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                chat['storeName'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                  fontSize: 16,
                ),
              ),
              Text(
                chat['time'],
                style: TextStyle(
                  color: chat['unread'] > 0 ? const Color(0xFFF48221) : const Color(0xFF94A3B8),
                  fontSize: 12,
                  fontWeight: chat['unread'] > 0 ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    chat['lastMessage'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: chat['unread'] > 0 ? const Color(0xFF475569) : const Color(0xFF94A3B8),
                      fontWeight: chat['unread'] > 0 ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ),
                if (chat['unread'] > 0)
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF48221),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${chat['unread']}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          onTap: () {
            // Navigate to actual chat screen
          },
        );
      },
    );
  }

  Widget _buildNotificationsList() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: _notifications.length,
      separatorBuilder: (context, index) => const Divider(
        color: Color(0xFFF1F5F9),
        height: 1,
        indent: 76,
      ),
      itemBuilder: (context, index) {
        final notification = _notifications[index];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          leading: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: (notification['color'] as Color).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              notification['icon'] as IconData,
              color: notification['color'] as Color,
            ),
          ),
          title: Text(
            notification['title'],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
              fontSize: 15,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification['message'],
                  style: const TextStyle(
                    color: Color(0xFF64748B),
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  notification['time'],
                  style: const TextStyle(
                    color: Color(0xFF94A3B8),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          onTap: () {},
        );
      },
    );
  }
}
