import 'package:flutter/material.dart';
import 'product_details_screen.dart';

class StoreProfileScreen extends StatefulWidget {
  final String storeName;
  const StoreProfileScreen({super.key, this.storeName = 'Tech Haven Official'});

  @override
  State<StoreProfileScreen> createState() => _StoreProfileScreenState();
}

class _StoreProfileScreenState extends State<StoreProfileScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isFollowing = false;

  final List<Map<String, dynamic>> _storeProducts = [
    {
      'name': 'Wireless Noise Cancelling Earbuds',
      'dealPrice': '\$89.99',
      'originalPrice': '\$129.99',
      'rating': '4.8',
      'reviews': '1.2k',
      'sales': '5k+ sold',
      'image': Icons.headphones,
    },
    {
      'name': 'Smart Fitness Watch Series 5',
      'dealPrice': '\$199.00',
      'originalPrice': '\$249.00',
      'rating': '4.9',
      'reviews': '850',
      'sales': '2k+ sold',
      'image': Icons.watch,
    },
    {
      'name': 'Power Bank 20000mAh',
      'dealPrice': '\$45.00',
      'originalPrice': '\$60.00',
      'rating': '4.7',
      'reviews': '3.4k',
      'sales': '10k+ sold',
      'image': Icons.battery_charging_full,
    },
    {
      'name': 'Mechanical Gaming Keyboard',
      'dealPrice': '\$120.00',
      'originalPrice': '\$150.00',
      'rating': '4.6',
      'reviews': '420',
      'sales': '1k+ sold',
      'image': Icons.keyboard,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 220,
              pinned: true,
              backgroundColor: const Color(0xFF0F172A),
              iconTheme: const IconThemeData(color: Colors.white),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Store Cover Image
                    Image.network(
                      'https://picsum.photos/800/400?tech,abstract',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: const Color(0xFF1E293B),
                        child: const Center(
                          child: Icon(Icons.storefront, color: Colors.white24, size: 80),
                        ),
                      ),
                    ),
                    // Gradient overlay
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            const Color(0xFF0F172A).withOpacity(0.8),
                            const Color(0xFF0F172A),
                          ],
                          stops: const [0.4, 0.8, 1.0],
                        ),
                      ),
                    ),
                    // Store Info
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // Store Logo
                            Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Icon(Icons.computer, color: Color(0xFFF48221), size: 32),
                              ),
                            ),
                            const SizedBox(width: 16),
                            // Store Details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        widget.storeName,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      const Icon(Icons.verified, color: Colors.blueAccent, size: 16),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: const [
                                      Icon(Icons.star, color: Color(0xFFFBBF24), size: 14),
                                      SizedBox(width: 4),
                                      Text(
                                        '4.8',
                                        style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        '|',
                                        style: TextStyle(color: Colors.white54, fontSize: 12),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        '142K Followers',
                                        style: TextStyle(color: Colors.white70, fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // Follow Button
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isFollowing = !_isFollowing;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: _isFollowing ? Colors.white24 : const Color(0xFFF48221),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: _isFollowing ? Colors.white : Colors.transparent,
                                  ),
                                ),
                                child: Text(
                                  _isFollowing ? 'Following' : '+ Follow',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(48),
                child: Container(
                  color: Colors.white,
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: const Color(0xFFF48221),
                    indicatorWeight: 3,
                    labelColor: const Color(0xFFF48221),
                    unselectedLabelColor: const Color(0xFF64748B),
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    tabs: const [
                      Tab(text: 'Home'),
                      Tab(text: 'Products'),
                      Tab(text: 'Categories'),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            // Home Tab
            _buildHomeTab(),
            // Products Tab
            _buildProductsTab(),
            // Categories Tab
            const Center(child: Text('Categories Content', style: TextStyle(color: Color(0xFF64748B)))),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Store Campaign Banner
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                colors: [Color(0xFFF48221), Color(0xFFFF9D4A)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Store Voucher',
                          style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Get \$10 OFF',
                          style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Min. spend \$100',
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFFF48221),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      minimumSize: Size.zero,
                    ),
                    child: const Text('Claim', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'New Arrivals',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
          ),
          const SizedBox(height: 16),
          _buildProductsTab(),
        ],
      ),
    );
  }

  Widget _buildProductsTab() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      physics: const NeverScrollableScrollPhysics(), // since it's inside SingleChildScrollView or TabView
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: _storeProducts.length,
      itemBuilder: (context, index) {
        final product = _storeProducts[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsScreen(product: product),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    child: Center(
                      child: Icon(
                        product['image'] as IconData,
                        size: 60,
                        color: const Color(0xFF94A3B8),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product['name'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product['dealPrice'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF48221),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Color(0xFFFBBF24), size: 12),
                          const SizedBox(width: 4),
                          Text(
                            product['rating'],
                            style: const TextStyle(fontSize: 11, color: Color(0xFF64748B)),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '• ${product['sales']}',
                            style: const TextStyle(fontSize: 10, color: Color(0xFF94A3B8)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
