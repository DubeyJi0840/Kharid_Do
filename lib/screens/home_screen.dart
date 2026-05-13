import 'package:flutter/material.dart';
import 'search_screen.dart';
import 'filter_sort_bottom_sheet.dart';
import 'categories_screen.dart';
import 'product_details_screen.dart';
import 'favorites_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = 'All';

  final List<Map<String, dynamic>> _allProducts = [
    {
      'id': 'p1',
      'name': 'Retro Instax Camera 400 Series',
      'dealPrice': r'$79.00',
      'rating': '4.8',
      'icon': Icons.camera_alt,
      'category': 'Electronics',
    },
    {
      'id': 'p2',
      'name': 'Premium Aviator Sunglasses',
      'dealPrice': r'$115.00',
      'rating': '4.5',
      'icon': Icons.wb_sunny_outlined,
      'category': 'Fashion',
    },
    {
      'id': 'p3',
      'name': 'Professional Studio Mic',
      'dealPrice': r'$199.00',
      'rating': '5.0',
      'icon': Icons.mic,
      'category': 'Electronics',
    },
    {
      'id': 'p4',
      'name': 'Minimalist Ceramic Mug',
      'dealPrice': r'$24.00',
      'rating': '4.9',
      'icon': Icons.local_cafe,
      'category': 'Home & Living',
    },
    {
      'id': 'p5',
      'name': 'Velvet Accent Chair',
      'dealPrice': r'$149.00',
      'rating': '4.7',
      'icon': Icons.weekend,
      'category': 'Home & Living',
    },
    {
      'id': 'p6',
      'name': 'Matte Lipstick Set',
      'dealPrice': r'$35.00',
      'rating': '4.6',
      'icon': Icons.content_cut,
      'category': 'Beauty',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: const Color(0xFFF8FAFC),
        elevation: 0,
        scrolledUnderElevation: 0,
        leadingWidth: 0,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFF9D4A), Color(0xFFF48221)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFF48221).withOpacity(0.25),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: const Icon(
                Icons.shopping_bag_rounded,
                color: Colors.white,
                size: 26,
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Kharid Do',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontSize: 26,
                    height: 1,
                    letterSpacing: -1,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Curated Exclusive Deals',
                  style: TextStyle(
                    color: Color(0xFF94A3B8),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          _buildAppBarAction(
            Icons.favorite_rounded,
            () => Navigator.push(context, MaterialPageRoute(builder: (context) => const FavoritesScreen())),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: _buildAppBarAction(
              Icons.shopping_cart_rounded,
              () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen())),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Decorative Background Blobs
          Positioned(
            top: 200,
            right: -60,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFF48221).withOpacity(0.04),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF3B82F6).withOpacity(0.03),
              ),
            ),
          ),
          
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Column(
              children: [
                const SizedBox(height: 8),
                // Search Bar & Filter
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 25,
                              offset: const Offset(0, 12),
                            ),
                          ],
                        ),
                        child: TextField(
                          readOnly: true,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SearchScreen(),
                              ),
                            );
                          },
                          decoration: InputDecoration(
                            hintText: 'Search for products, brands...',
                            hintStyle: const TextStyle(color: Color(0xFF94A3B8), fontWeight: FontWeight.w500),
                            prefixIcon: const Icon(Icons.search_rounded, color: Color(0xFFF48221)),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xFF0F172A),
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF0F172A).withOpacity(0.2),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.tune_rounded, color: Colors.white, size: 24),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) => FractionallySizedBox(
                              heightFactor: 0.85,
                              child: const FilterSortBottomSheet(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // Banner Section
                _buildBanner(),
                const SizedBox(height: 32),

                // Categories
                _buildSectionHeader(
                  'Categories',
                  'View All',
                  onActionPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CategoriesScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                _buildCategories(),
                const SizedBox(height: 32),

                // Flash Sale
                _buildFlashSaleHeader(context),
                const SizedBox(height: 20),
                _buildFlashSaleList(),
                const SizedBox(height: 32),

                // Recommended for You
                _buildSectionHeader('Recommended for You', ''),
                const SizedBox(height: 20),
                _buildRecommendedGrid(context),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBarAction(IconData icon, VoidCallback onTap) {
    return IconButton(
      onPressed: onTap,
      icon: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFF1F5F9)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: const Color(0xFF0F172A),
          size: 22,
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 190,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            gradient: const LinearGradient(
              colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF0F172A).withOpacity(0.2),
                blurRadius: 25,
                offset: const Offset(0, 15),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Abstract Background Decoration
              Positioned(
                right: -20,
                top: -20,
                child: Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFFF48221).withOpacity(0.15),
                        Colors.transparent,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF48221),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'SUMMER SPECIAL',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Flat 70% Off',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        height: 1,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'On all gadgets & smart home devices',
                      style: TextStyle(
                        color: Color(0xFF94A3B8),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              // Floating Badge
              Positioned(
                right: 24,
                top: 24,
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.08),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ),
                  child: const Icon(
                    Icons.auto_awesome_rounded,
                    color: Color(0xFFFBBF24),
                    size: 28,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: index == 0 ? 30 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: index == 0 ? const Color(0xFFF48221) : const Color(0xFFE2E8F0),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(
    String title,
    String action, {
    VoidCallback? onActionPressed,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: 20,
              decoration: BoxDecoration(
                color: const Color(0xFFF48221),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: Color(0xFF0F172A),
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
        if (action.isNotEmpty)
          TextButton(
            onPressed: onActionPressed,
            child: Row(
              children: [
                Text(
                  action,
                  style: const TextStyle(
                    color: Color(0xFFF48221),
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 12,
                  color: Color(0xFFF48221),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildFlashSaleHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF7ED),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.bolt_rounded,
                color: Color(0xFFF48221),
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'Flash Sale',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: Color(0xFF0F172A),
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF0F172A),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const Icon(Icons.access_time, color: Colors.white, size: 12),
              const SizedBox(width: 4),
              StreamBuilder<int>(
                stream: Stream.periodic(const Duration(seconds: 1), (i) => i),
                builder: (context, snapshot) {
                  // Mock countdown starting from 02:45:12
                  final duration = const Duration(hours: 2, minutes: 45, seconds: 12);
                  final remaining = duration - Duration(seconds: snapshot.data ?? 0);
                  
                  if (remaining.isNegative) return const Text('00:00:00', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold));
                  
                  String twoDigits(int n) => n.toString().padLeft(2, '0');
                  final hours = twoDigits(remaining.inHours);
                  final minutes = twoDigits(remaining.inMinutes.remainder(60));
                  final seconds = twoDigits(remaining.inSeconds.remainder(60));
                  
                  return Text(
                    '$hours:$minutes:$seconds',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            // In a real app, this would filter by flash sale
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CategoriesScreen()),
            );
          },
          child: const Text(
            'See More',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xFFF48221),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategories() {
    final List<Map<String, dynamic>> categories = [
      {
        'icon': Icons.grid_view_rounded,
        'label': 'All',
        'bgColor': const Color(0xFFF1F5F9),
        'iconColor': const Color(0xFF64748B),
      },
      {
        'icon': Icons.devices,
        'label': 'Electronics',
        'bgColor': const Color(0xFFFFF7ED),
        'iconColor': const Color(0xFFF97316),
      },
      {
        'icon': Icons.checkroom,
        'label': 'Fashion',
        'bgColor': const Color(0xFFEFF6FF),
        'iconColor': const Color(0xFF3B82F6),
      },
      {
        'icon': Icons.weekend,
        'label': 'Home & Living',
        'bgColor': const Color(0xFFF0FDF4),
        'iconColor': const Color(0xFF22C55E),
      },
      {
        'icon': Icons.content_cut,
        'label': 'Beauty',
        'bgColor': const Color(0xFFFDF2F8),
        'iconColor': const Color(0xFFEC4899),
      },
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: categories.map((cat) {
          final isSelected = _selectedCategory == cat['label'];
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: _buildCategoryItem(
              cat['icon'],
              cat['label'],
              isSelected ? const Color(0xFFF48221) : cat['bgColor'],
              isSelected ? Colors.white : cat['iconColor'],
              isSelected,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCategoryItem(
    IconData icon,
    String label,
    Color bgColor,
    Color iconColor,
    bool isSelected,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategory = label;
        });
      },
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF0F172A) : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected ? Colors.transparent : const Color(0xFFF1F5F9),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: isSelected
                      ? const Color(0xFF0F172A).withOpacity(0.2)
                      : Colors.black.withOpacity(0.03),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Icon(
              icon,
              color: isSelected ? Colors.white : const Color(0xFF64748B),
              size: 26,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
              color: isSelected ? const Color(0xFF0F172A) : const Color(0xFF64748B),
              letterSpacing: -0.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFlashSaleList() {
    return SizedBox(
      height: 240,
      child: ListView(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        children: [
          _buildFlashSaleCard(
            'Wireless Headphones',
            '\$129',
            '\$240',
            '45% OFF',
            Icons.headphones_rounded,
          ),
          const SizedBox(width: 16),
          _buildFlashSaleCard(
            'Classic Wrist Watch',
            '\$85',
            '\$120',
            '30% OFF',
            Icons.watch_rounded,
          ),
          const SizedBox(width: 16),
          _buildFlashSaleCard(
            'Sports Sneakers',
            '\$99',
            '\$150',
            '34% OFF',
            Icons.directions_run_rounded,
          ),
        ],
      ),
    );
  }

  Widget _buildFlashSaleCard(
    String title,
    String price,
    String oldPrice,
    String discount,
    IconData icon,
  ) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF1F5F9)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 10),
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
                color: Color(0xFFF8FAFC),
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Icon(icon, size: 60, color: const Color(0xFF94A3B8)),
                  ),
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEF4444),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        discount,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF0F172A),
                    letterSpacing: -0.5,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFFF48221),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      oldPrice,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF94A3B8),
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: 0.7,
                    minHeight: 4,
                    backgroundColor: const Color(0xFFF1F5F9),
                    valueColor: const AlwaysStoppedAnimation(Color(0xFFFBBF24)),
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  '12 sold of 20',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF94A3B8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendedGrid(BuildContext context) {
    final filteredProducts = _selectedCategory == 'All'
        ? _allProducts
        : _allProducts
              .where((p) => p['category'] == _selectedCategory)
              .toList();

    if (filteredProducts.isEmpty) {
      return Container(
        height: 200,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.layers_clear_rounded, size: 48, color: Colors.grey[300]),
            const SizedBox(height: 16),
            Text(
              'No items found in $_selectedCategory',
              style: const TextStyle(
                color: Color(0xFF64748B),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      itemCount: filteredProducts.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final product = filteredProducts[index];
        return _buildRecommendedCard(
          context,
          product['id'],
          product['name'],
          product['dealPrice'],
          product['rating'],
          product['icon'],
        );
      },
    );
  }

  Widget _buildRecommendedCard(
    BuildContext context,
    String id,
    String title,
    String price,
    String rating,
    IconData icon,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
              product: {
                'id': id,
                'name': title,
                'dealPrice': price,
                'rating': rating,
                'image': icon,
              },
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFFF1F5F9)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF8FAFC),
                      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                    ),
                    child: Center(
                      child: Icon(icon, size: 50, color: const Color(0xFF94A3B8)),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.favorite_rounded,
                        color: Color(0xFFCBD5E1),
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF0F172A),
                      height: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star_rounded, color: Color(0xFFFBBF24), size: 16),
                          const SizedBox(width: 4),
                          Text(
                            rating,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF64748B),
                            ),
                          ),
                        ],
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
  }
}
