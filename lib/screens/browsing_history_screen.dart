import 'package:flutter/material.dart';
import 'product_details_screen.dart';

class BrowsingHistoryScreen extends StatefulWidget {
  const BrowsingHistoryScreen({super.key});

  @override
  State<BrowsingHistoryScreen> createState() => _BrowsingHistoryScreenState();
}

class _BrowsingHistoryScreenState extends State<BrowsingHistoryScreen> {
  late List<Map<String, dynamic>> _historyItems;

  @override
  void initState() {
    super.initState();
    _historyItems = [
      {
        'date': 'Today',
        'products': [
          {
            'name': 'Wireless Noise Cancelling Earbuds',
            'dealPrice': '\$89.99',
            'originalPrice': '\$129.99',
            'rating': '4.8',
            'image': Icons.headphones,
          },
          {
            'name': 'Matte Lipstick Set',
            'dealPrice': '\$35.00',
            'originalPrice': '\$50.00',
            'rating': '4.6',
            'image': Icons.content_cut,
          },
        ],
      },
      {
        'date': 'Yesterday',
        'products': [
          {
            'name': 'Smart Fitness Watch Series 5',
            'dealPrice': '\$199.00',
            'originalPrice': '\$249.00',
            'rating': '4.9',
            'image': Icons.watch,
          },
          {
            'name': 'Minimalist Ceramic Mug',
            'dealPrice': '\$24.00',
            'originalPrice': null,
            'rating': '4.9',
            'image': Icons.local_cafe,
          },
          {
            'name': 'Retro Instax Camera 400',
            'dealPrice': '\$79.00',
            'originalPrice': '\$100.00',
            'rating': '4.8',
            'image': Icons.camera_alt,
          },
        ],
      },
    ];
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
          'Recently Viewed',
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              if (_historyItems.isNotEmpty) {
                setState(() {
                  _historyItems.clear();
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('History cleared successfully'),
                    backgroundColor: Color(0xFF10B981),
                  ),
                );
              }
            },
            child: const Text(
              'Clear',
              style: TextStyle(
                color: Color(0xFFEF4444),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: _historyItems.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              itemCount: _historyItems.length,
              itemBuilder: (context, index) {
                final group = _historyItems[index];
                final products = group['products'] as List;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 16, top: index == 0 ? 0 : 24),
                      child: Text(
                        group['date'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, pIndex) {
                        final product = products[pIndex];
                        return _buildProductCard(product);
                      },
                    ),
                  ],
                );
              },
            ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
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
          border: Border.all(color: const Color(0xFFE2E8F0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
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
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product['name'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0F172A),
                        height: 1.2,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (product['originalPrice'] != null)
                          Text(
                            product['originalPrice'],
                            style: const TextStyle(
                              fontSize: 11,
                              color: Color(0xFF94A3B8),
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product['dealPrice'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFF48221),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                color: Color(0xFFF1F5F9),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.shopping_cart_outlined,
                                size: 14,
                                color: Color(0xFF0F172A),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: Color(0xFFF1F5F9),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.history, size: 64, color: Color(0xFFCBD5E1)),
          ),
          const SizedBox(height: 24),
          const Text(
            'No History',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Your recently viewed items will appear here.',
            style: TextStyle(
              color: Color(0xFF64748B),
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF48221),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Start Shopping', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
