import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF0F172A)),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Notifications',
            style: TextStyle(
              color: Color(0xFF0F172A),
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert, color: Color(0xFF0F172A)),
              onPressed: () {},
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Color(0xFFF48221),
            indicatorWeight: 3,
            labelColor: Color(0xFFF48221),
            unselectedLabelColor: Color(0xFF94A3B8),
            labelStyle: TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Unread'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildNotificationList(),
            _buildUnreadNotificationList(), // Placeholder for now
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationList() {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'OFFERS & PROMOS',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: Color(0xFF475569),
                letterSpacing: 0.5,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF7ED),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                '3 New',
                style: TextStyle(
                  color: Color(0xFFF48221),
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildNotificationTile(
          title: 'Flash Sale: 50% Off Electronics!',
          subtitle: 'Upgrade your setup today with our biggest tech sale of the year.',
          time: '2m ago',
          icon: Icons.sell_rounded,
          iconColor: const Color(0xFFF48221),
          iconBgColor: const Color(0xFFFFF7ED),
          isUnread: true,
        ),
        _buildNotificationTile(
          title: 'Exclusive Gold Member Reward',
          subtitle: 'Claim your free shipping voucher valid for the next 24 hours.',
          time: '1h ago',
          icon: Icons.local_fire_department_rounded,
          iconColor: const Color(0xFFF97316),
          iconBgColor: const Color(0xFFFFF7ED),
          isUnread: false,
        ),
        _buildNotificationTile(
          title: 'Summer Collection Sneak Peek',
          subtitle: 'Be the first to shop the new arrivals from top brands.',
          time: '3h ago',
          icon: Icons.card_giftcard_rounded,
          iconColor: const Color(0xFFF48221),
          iconBgColor: const Color(0xFFFFF7ED),
          isUnread: true,
        ),
        const SizedBox(height: 32),
        const Text(
          'DELIVERY UPDATES',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: Color(0xFF475569),
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 16),
        _buildNotificationTile(
          title: 'Out for Delivery',
          subtitle: 'Order #DZ-9921 is arriving today between 2:00 PM - 4:00 PM.',
          time: '35m ago',
          icon: Icons.inventory_2_rounded,
          iconColor: const Color(0xFF475569),
          iconBgColor: const Color(0xFFF1F5F9),
          isUnread: true,
        ),
        _buildNotificationTile(
          title: 'Order Shipped',
          subtitle: 'Your package from \'Tech Store\' has been dispatched and is on its way.',
          time: 'Yesterday',
          icon: Icons.local_shipping_rounded,
          iconColor: const Color(0xFF475569),
          iconBgColor: const Color(0xFFF1F5F9),
          isUnread: false,
        ),
        _buildNotificationTile(
          title: 'Delivered Successfully',
          subtitle: 'Order #DZ-8812 was left at your front door. Enjoy your purchase!',
          time: '2 days ago',
          icon: Icons.check_circle_rounded,
          iconColor: const Color(0xFF10B981),
          iconBgColor: const Color(0xFFECFDF5),
          isUnread: false,
        ),
      ],
    );
  }

  Widget _buildUnreadNotificationList() {
    final unreadTiles = [
      _buildNotificationTile(
        title: 'Flash Sale: 50% Off Electronics!',
        subtitle: 'Upgrade your setup today with our biggest tech sale of the year.',
        time: '2m ago',
        icon: Icons.sell_rounded,
        iconColor: const Color(0xFFF48221),
        iconBgColor: const Color(0xFFFFF7ED),
        isUnread: true,
      ),
      _buildNotificationTile(
        title: 'Summer Collection Sneak Peek',
        subtitle: 'Be the first to shop the new arrivals from top brands.',
        time: '3h ago',
        icon: Icons.card_giftcard_rounded,
        iconColor: const Color(0xFFF48221),
        iconBgColor: const Color(0xFFFFF7ED),
        isUnread: true,
      ),
      _buildNotificationTile(
        title: 'Out for Delivery',
        subtitle: 'Order #DZ-9921 is arriving today between 2:00 PM - 4:00 PM.',
        time: '35m ago',
        icon: Icons.inventory_2_rounded,
        iconColor: const Color(0xFF475569),
        iconBgColor: const Color(0xFFF1F5F9),
        isUnread: true,
      ),
    ];

    return ListView(
      padding: const EdgeInsets.all(24),
      children: unreadTiles,
    );
  }

  Widget _buildNotificationTile({
    required String title,
    required String subtitle,
    required String time,
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required bool isUnread,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          if (isUnread)
            Positioned(
              left: 0,
              top: 16,
              bottom: 16,
              child: Container(
                width: 4,
                decoration: const BoxDecoration(
                  color: Color(0xFFF48221),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: iconBgColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: iconColor, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF0F172A),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            time,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Color(0xFF94A3B8),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF64748B),
                          height: 1.4,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                if (isUnread)
                  Container(
                    margin: const EdgeInsets.only(left: 8, top: 4),
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF48221),
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
