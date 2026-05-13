import 'package:flutter/material.dart';
import 'category_products_screen.dart';
import 'cart_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _recentSearches = [
    'Wireless Earbuds',
    'Mechanical Keyboard',
    'Oversized Hoodie',
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
        title: const Text(
          'Search',
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        actions: [
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
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Input
            TextField(
              controller: _searchController,
              autofocus: true,
              onSubmitted: (value) {
                if (value.trim().isNotEmpty && !_recentSearches.contains(value)) {
                  setState(() {
                    _recentSearches.insert(0, value);
                  });
                }
              },
              decoration: InputDecoration(
                hintText: 'Search for products, brands...',
                hintStyle: const TextStyle(
                  color: Color(0xFF94A3B8),
                  fontSize: 13,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xFF94A3B8),
                  size: 20,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Color(0xFF94A3B8),
                    size: 18,
                  ),
                  onPressed: () {
                    _searchController.clear();
                  },
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: const BorderSide(color: Color(0xFFF48221)),
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Recent Searches Header
            if (_recentSearches.isNotEmpty) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recent Searches',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _recentSearches.clear();
                      });
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      'Clear All',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFF48221),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Recent Search Chips
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: _recentSearches.map((search) => _buildRecentSearchChip(search)).toList(),
              ),
              const SizedBox(height: 32),
            ],

            // Trending Keywords
            const Text(
              'Trending Keywords',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: [
                _buildTrendingKeyword('iPhone 15 Pro'),
                _buildTrendingKeyword('Airpods Max'),
                _buildTrendingKeyword('Gaming Laptop'),
                _buildTrendingKeyword('Smart Watch'),
              ],
            ),
            const SizedBox(height: 32),

            // Popular Categories
            const Text(
              'Popular Categories',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 16),
            _buildCategoryTile(
              context,
              Icons.devices,
              'Electronics',
              'Phones, Laptops, Gadgets',
            ),
            const SizedBox(height: 12),
            _buildCategoryTile(
              context,
              Icons.checkroom,
              'Fashion',
              'Mens, Womens, Kids Wear',
            ),
            const SizedBox(height: 12),
            _buildCategoryTile(
              context,
              Icons.weekend,
              'Home & Living',
              'Furniture, Decor, Kitchen',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentSearchChip(String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _searchController.text = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF7ED), // Light orange
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xFFFDE68A).withOpacity(0.5),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.history, size: 14, color: Color(0xFFF48221)),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF334155),
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                setState(() {
                  _recentSearches.remove(label);
                });
              },
              child: const Icon(Icons.close, size: 14, color: Color(0xFF94A3B8)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrendingKeyword(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: Color(0xFFFFF7ED),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.trending_up,
              size: 14,
              color: Color(0xFFF48221),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF334155),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTile(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
  ) {
    return InkWell(
      onTap: () {
        String count = '1,240';
        if (title == 'Fashion') count = '856';
        if (title == 'Home & Living') count = '420';

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                CategoryProductsScreen(categoryName: title, itemCount: count),
          ),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9), // Light blue-gray
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: const Color(0xFF475569), size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: Color(0xFF94A3B8),
            ),
          ],
        ),
      ),
    );
  }
}
