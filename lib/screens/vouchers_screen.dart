import 'package:flutter/material.dart';

class VouchersScreen extends StatefulWidget {
  const VouchersScreen({super.key});

  @override
  State<VouchersScreen> createState() => _VouchersScreenState();
}

class _VouchersScreenState extends State<VouchersScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> _platformVouchers = [
    {
      'title': '\$10 OFF',
      'subtitle': 'Min. spend \$100',
      'validUntil': 'Valid till 30 Apr',
      'type': 'Platform',
      'color': const Color(0xFFF48221),
    },
    {
      'title': '15% OFF',
      'subtitle': 'Capped at \$20',
      'validUntil': 'Valid till 15 May',
      'type': 'Platform',
      'color': const Color(0xFFF48221),
    },
  ];

  final List<Map<String, dynamic>> _shippingVouchers = [
    {
      'title': 'Free Shipping',
      'subtitle': 'Min. spend \$30',
      'validUntil': 'Valid till 10 May',
      'type': 'Shipping',
      'color': const Color(0xFF10B981),
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF0F172A)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Voucher Center',
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
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
              Tab(text: 'My Vouchers'),
              Tab(text: 'Get More'),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildMyVouchersTab(),
          _buildGetMoreTab(),
        ],
      ),
    );
  }

  Widget _buildMyVouchersTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Input code field
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Enter promo code',
                      hintStyle: TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF48221),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    elevation: 0,
                  ),
                  child: const Text('Apply', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          // Categories
          const Text(
            'Platform Discounts',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 16),
          ..._platformVouchers.map((v) => _buildVoucherCard(v, isClaimed: true)).toList(),
          const SizedBox(height: 24),
          const Text(
            'Free Shipping',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 16),
          ..._shippingVouchers.map((v) => _buildVoucherCard(v, isClaimed: true)).toList(),
        ],
      ),
    );
  }

  Widget _buildGetMoreTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.confirmation_number, size: 64, color: Color(0xFFCBD5E1)),
          ),
          const SizedBox(height: 24),
          const Text(
            'No New Vouchers',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Check back later for more exciting deals!',
            style: TextStyle(
              color: Color(0xFF64748B),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVoucherCard(Map<String, dynamic> voucher, {bool isClaimed = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Left Ticket Edge
          Container(
            width: 100,
            decoration: BoxDecoration(
              color: voucher['color'],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    voucher['type'] == 'Shipping' ? Icons.local_shipping : Icons.discount,
                    color: Colors.white,
                    size: 28,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    voucher['type'],
                    style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          // Dashed Line (simulated with Container and Stack)
          Stack(
            children: [
              Container(width: 1, color: Colors.white),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  8,
                  (_) => Container(
                    width: 2,
                    height: 6,
                    color: const Color(0xFFE2E8F0),
                  ),
                ),
              ),
              Positioned(
                top: -8,
                left: -8,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF8FAFC),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                bottom: -8,
                left: -8,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF8FAFC),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          voucher['title'],
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          voucher['subtitle'],
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF64748B),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          voucher['validUntil'],
                          style: const TextStyle(
                            fontSize: 10,
                            color: Color(0xFF94A3B8),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isClaimed)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: voucher['color']),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Use',
                        style: TextStyle(
                          color: voucher['color'],
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
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
