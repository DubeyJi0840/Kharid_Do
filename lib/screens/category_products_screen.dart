import 'package:flutter/material.dart';
import 'product_details_screen.dart';
import 'cart_screen.dart';
import 'search_screen.dart';

class CategoryProductsScreen extends StatefulWidget {
  final String categoryName;
  final String itemCount;

  const CategoryProductsScreen({
    super.key,
    required this.categoryName,
    required this.itemCount,
  });

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  final List<String> _subcategories = ['All', 'Laptops', 'Phones', 'Audio'];
  String _selectedSubcategory = 'All';

  List<Map<String, dynamic>> get _products {
    if (widget.categoryName == 'Fashion') {
      return [
        {
          'name': 'Nike Air Force 1 \'07',
          'image': 'assets/images/placeholder.png',
          'badge': 'NEW',
          'badgeColor': const Color(0xFFF48221),
          'rating': '4.9',
          'reviews': '2.1k',
          'dealPrice': '\$110.00',
          'originalPrice': null,
          'isFavorite': true,
        },
        {
          'name': 'Oversized Vintage Wash Graphic Tee',
          'image': 'assets/images/placeholder.png',
          'badge': '20% OFF',
          'badgeColor': const Color(0xFFF48221),
          'rating': '4.6',
          'reviews': '845',
          'dealPrice': '\$32.00',
          'originalPrice': '\$40.00',
          'isFavorite': false,
        },
        {
          'name': 'Levi\'s 501 Original Fit Jeans',
          'image': 'assets/images/placeholder.png',
          'badge': null,
          'badgeColor': null,
          'rating': '4.8',
          'reviews': '5k+',
          'dealPrice': '\$79.50',
          'originalPrice': null,
          'isFavorite': false,
        },
      ];
    } else if (widget.categoryName == 'Home & Living') {
      return [
        {
          'name': 'Minimalist Velvet Accent Chair',
          'image': 'assets/images/placeholder.png',
          'badge': 'TOP RATED',
          'badgeColor': const Color(0xFFF59E0B),
          'rating': '4.7',
          'reviews': '340',
          'dealPrice': '\$149.99',
          'originalPrice': '\$199.99',
          'isFavorite': false,
        },
        {
          'name': 'Nordic Ceramic Coffee Mug Set',
          'image': 'assets/images/placeholder.png',
          'badge': '15% OFF',
          'badgeColor': const Color(0xFFF48221),
          'rating': '4.9',
          'reviews': '1.2k',
          'dealPrice': '\$24.99',
          'originalPrice': '\$29.99',
          'isFavorite': true,
        },
      ];
    } else {
      // Default / Electronics
      return [
        {
          'name': 'MacBook Pro M2 - Space Gray 14" 512GB',
          'image': 'assets/images/placeholder.png', // placeholder
          'badge': '25% OFF',
          'badgeColor': const Color(0xFFF48221),
          'rating': '4.8',
          'reviews': '1.2k',
          'dealPrice': '\$1,599.00',
          'originalPrice': '\$1,999.00',
          'isFavorite': false,
        },
        {
          'name': 'Sony WH-1000XM5 Noise Canceling...',
          'image': 'assets/images/placeholder.png', // placeholder
          'badge': '30% OFF',
          'badgeColor': const Color(0xFFF48221),
          'rating': '4.9',
          'reviews': '845',
          'dealPrice': '\$279.00',
          'originalPrice': '\$399.00',
          'isFavorite': false,
        },
        {
          'name': 'Canon EOS R6 Mirrorless Digital...',
          'image': 'assets/images/placeholder.png', // placeholder
          'badge': null,
          'badgeColor': null,
          'rating': '4.7',
          'reviews': '210',
          'dealPrice': '\$2,199.00',
          'originalPrice': '\$2,499.00',
          'isFavorite': false,
        },
        {
          'name': 'iPhone 15 Pro - Titanium Blue 256GB',
          'image': 'assets/images/placeholder.png', // placeholder
          'badge': '15% OFF',
          'badgeColor': const Color(0xFFF48221),
          'rating': '4.9',
          'reviews': '3.1k',
          'dealPrice': '\$999.00',
          'originalPrice': '\$1,099.00',
          'isFavorite': true,
        },
        {
          'name': 'Apple Watch Series 9 GPS + Cellular',
          'image': 'assets/images/placeholder.png', // placeholder
          'badge': 'HOT',
          'badgeColor': const Color(0xFFF59E0B), // amber
          'rating': '4.6',
          'reviews': '560',
          'dealPrice': '\$399.00',
          'originalPrice': '\$429.00',
          'isFavorite': false,
        },
        {
          'name': 'Marshall Stanmore II Wireless Bluetooth...',
          'image': 'assets/images/placeholder.png', // placeholder
          'badge': null,
          'badgeColor': null,
          'rating': '4.8',
          'reviews': '1.4k',
          'dealPrice': '\$249.00',
          'originalPrice': '\$349.00',
          'isFavorite': true,
        },
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF0F172A)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          children: [
            Text(
              widget.categoryName,
              style: const TextStyle(
                color: Color(0xFF0F172A),
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              '${widget.itemCount} items found',
              style: const TextStyle(
                color: Color(0xFF64748B),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Color(0xFF0F172A)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Color(0xFF0F172A),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Subcategories
            SizedBox(
              height: 36,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _subcategories.length,
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final isSelected =
                      _subcategories[index] == _selectedSubcategory;
                  final isAll = _subcategories[index] == 'All';
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedSubcategory = _subcategories[index];
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFFF48221)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFFF48221)
                              : const Color(0xFFE2E8F0),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Text(
                            _subcategories[index],
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : const Color(0xFF334155),
                              fontWeight: isSelected
                                  ? FontWeight.w700
                                  : FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                          if (!isAll) ...[
                            const SizedBox(width: 4),
                            Icon(
                              Icons.keyboard_arrow_down,
                              size: 16,
                              color: isSelected
                                  ? Colors.white
                                  : const Color(0xFF334155),
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // Filter, Sort, Deals
            Row(
              children: [
                _buildActionButton(Icons.filter_list, 'Filter'),
                const SizedBox(width: 8),
                _buildActionButton(Icons.swap_vert, 'Sort'),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF7ED),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Deals ending soon',
                    style: TextStyle(
                      color: Color(0xFFF48221),
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Product Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65, // Adjust to fit content
                crossAxisSpacing: 12,
                mainAxisSpacing: 16,
              ),
              itemCount: _products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailsScreen(product: _products[index]),
                      ),
                    );
                  },
                  child: _buildProductCard(_products[index]),
                );
              },
            ),
            const SizedBox(height: 24),

            // Load More
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFF7ED),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Load More Products',
                  style: TextStyle(
                    color: Color(0xFFF48221),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'Showing 6 of 1,240 items',
                style: TextStyle(
                  color: Color(0xFF94A3B8),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Category Rating
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '4.8',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF0F172A),
                        height: 1.0,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: List.generate(
                        5,
                        (index) => const Icon(
                          Icons.star,
                          color: Color(0xFFF48221),
                          size: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Category Rating',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    children: [
                      _buildRatingBar(5, 0.82, '82%'),
                      const SizedBox(height: 8),
                      _buildRatingBar(4, 0.12, '12%'),
                      const SizedBox(height: 8),
                      _buildRatingBar(3, 0.04, '4%'),
                      const SizedBox(height: 8),
                      _buildRatingBar(2, 0.01, '1%'),
                      const SizedBox(height: 8),
                      _buildRatingBar(1, 0.01, '1%'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: const Color(0xFF334155)),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF334155),
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image and badges
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFC),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    image: (product['image'] != null && product['image'] is String)
                        ? DecorationImage(
                            image: (product['image'] as String).startsWith('http')
                                ? NetworkImage(product['image']) as ImageProvider
                                : AssetImage(product['image']),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: (product['image'] == null || product['image'] is! String)
                      ? Center(
                          child: Icon(
                            Icons.image,
                            size: 48,
                            color: Colors.grey.withOpacity(76 / 255),
                          ),
                        )
                      : null,
                ),
                if (product['badge'] != null)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: product['badgeColor'],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        product['badge'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      product['isFavorite']
                          ? Icons.favorite
                          : Icons.favorite_border,
                      size: 16,
                      color: product['isFavorite']
                          ? const Color(0xFFF48221)
                          : const Color(0xFF94A3B8),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Details
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name'],
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0F172A),
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.star, color: Color(0xFFF48221), size: 14),
                    const SizedBox(width: 4),
                    Text(
                      product['rating'],
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF334155),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '(${product['reviews']})',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF94A3B8),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      product['dealPrice'],
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFFF48221),
                      ),
                    ),
                    if (product['originalPrice'] != null) ...[
                      const SizedBox(width: 6),
                      Text(
                        product['originalPrice'],
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF94A3B8),
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingBar(int star, double percentage, String label) {
    return Row(
      children: [
        Text(
          star.toString(),
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Color(0xFF0F172A),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Stack(
            children: [
              Container(
                height: 6,
                decoration: BoxDecoration(
                  color: const Color(0xFFE2E8F0),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              FractionallySizedBox(
                widthFactor: percentage,
                child: Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF48221),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 30,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Color(0xFF64748B),
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
