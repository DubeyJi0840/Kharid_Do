import 'package:flutter/material.dart';
import 'order_tracking_screen.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'My Orders',
            style: TextStyle(
              color: Color(0xFF1E293B),
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          centerTitle: false, // Match left title in image
          titleSpacing: 0, // Space from back button
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Color(0xFF1E293B)),
              onPressed: () {},
            ),
            const SizedBox(width: 8),
          ],
          bottom: const TabBar(
            indicatorColor: Color(0xFFF48221),
            indicatorWeight: 3,
            labelColor: Color(0xFFF48221),
            unselectedLabelColor: Color(0xFF94A3B8),
            labelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'In Progress'),
              Tab(text: 'Completed'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildOrdersList('All'),
            _buildOrdersList('In Progress'),
            _buildOrdersList('Completed'),
          ],
        ),
      ),
    );
  }

  Widget _buildOrdersList(String tab) {
    final List<Map<String, dynamic>> orders = [
      {
        'id': 'DZ-88291',
        'date': 'Oct 24, 2023',
        'status': 'IN PROGRESS',
        'price': r'$59.99',
        'items': '1 Item',
        'icon': Icons.directions_run,
        'statusColor': Colors.orange,
        'isCompleted': false,
      },
      {
        'id': 'DZ-77102',
        'date': 'Oct 15, 2023',
        'status': 'DELIVERED',
        'price': r'$129.00',
        'items': '2 Items',
        'icon': Icons.headset,
        'statusColor': Colors.green,
        'isCompleted': true,
      },
      {
        'id': 'DZ-66542',
        'date': 'Sep 28, 2023',
        'status': 'DELIVERED',
        'price': r'$85.50',
        'items': '1 Item',
        'icon': Icons.watch,
        'statusColor': Colors.green,
        'isCompleted': true,
      },
      {
        'id': 'DZ-55019',
        'date': 'Sep 12, 2023',
        'status': 'CANCELLED',
        'price': r'$449.00',
        'items': '1 Item',
        'icon': Icons.camera_alt,
        'statusColor': Colors.grey,
        'isCompleted': true,
      },
    ];

    List<Map<String, dynamic>> filteredOrders = orders;
    if (tab == 'In Progress') {
      filteredOrders = orders.where((o) => o['status'] == 'IN PROGRESS').toList();
    } else if (tab == 'Completed') {
      filteredOrders = orders.where((o) => o['status'] == 'DELIVERED' || o['status'] == 'CANCELLED').toList();
    }

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: filteredOrders.length,
      itemBuilder: (context, index) {
        return _buildOrderCard(context, filteredOrders[index]);
      },
    );
  }

  Widget _buildOrderCard(BuildContext context, Map<String, dynamic> order) {
    bool isCancelled = order['status'] == 'CANCELLED';
    bool isInProgress = order['status'] == 'IN PROGRESS';
    bool isDelivered = order['status'] == 'DELIVERED';

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image Container
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B), // Dark background as in image
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  order['icon'], 
                  size: 40, 
                  color: (order['id'] == 'DZ-88291') ? Colors.redAccent : Colors.white70,
                ),
              ),
              const SizedBox(width: 16),
              // Order Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'Order #${order['id']}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF1E293B),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          order['price'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF1E293B),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Date: ${order['date']}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF94A3B8),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          order['items'],
                          style: const TextStyle(
                            fontSize: 10,
                            color: Color(0xFF94A3B8),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: order['statusColor'],
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          order['status'],
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            color: order['statusColor'],
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Action Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    if (isInProgress) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OrderTrackingScreen(),
                        ),
                      );
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    side: const BorderSide(color: Color(0xFFE2E8F0)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    isInProgress ? 'Track Order' : 'Reorder',
                    style: const TextStyle(
                      color: Color(0xFF475569),
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isInProgress 
                        ? const Color(0xFFF48221) 
                        : (isCancelled ? const Color(0xFFF1F5F9) : const Color(0xFFFFF7ED)),
                    foregroundColor: isInProgress 
                        ? Colors.white 
                        : (isCancelled ? const Color(0xFF94A3B8) : const Color(0xFFF48221)),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    isDelivered && order['id'] == 'DZ-77102' ? 'Leave Review' : 'Details',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
