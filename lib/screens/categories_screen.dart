import 'package:flutter/material.dart';
import 'category_products_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final List<Map<String, dynamic>> _categories = [
    {
      'icon': Icons.devices,
      'name': 'Electronics',
      'color': const Color(0xFFF97316),
      'bgColor': const Color(0xFFFFF7ED),
      'items': '1.2k',
    },
    {
      'icon': Icons.checkroom,
      'name': 'Fashion',
      'color': const Color(0xFF3B82F6),
      'bgColor': const Color(0xFFEFF6FF),
      'items': '8k+',
    },
    {
      'icon': Icons.weekend,
      'name': 'Home & Living',
      'color': const Color(0xFF22C55E),
      'bgColor': const Color(0xFFF0FDF4),
      'items': '430',
    },
    {
      'icon': Icons.content_cut,
      'name': 'Beauty',
      'color': const Color(0xFFEC4899),
      'bgColor': const Color(0xFFFDF2F8),
      'items': '2.1k',
    },
    {
      'icon': Icons.sports_basketball,
      'name': 'Sports',
      'color': const Color(0xFFEAB308),
      'bgColor': const Color(0xFFFEFCE8),
      'items': '950',
    },
    {
      'icon': Icons.local_grocery_store,
      'name': 'Groceries',
      'color': const Color(0xFF14B8A6),
      'bgColor': const Color(0xFFF0FDFA),
      'items': '5k+',
    },
    {
      'icon': Icons.book,
      'name': 'Books',
      'color': const Color(0xFF8B5CF6),
      'bgColor': const Color(0xFFF5F3FF),
      'items': '10k+',
    },
    {
      'icon': Icons.toys,
      'name': 'Toys',
      'color': const Color(0xFFF43F5E),
      'bgColor': const Color(0xFFFFF1F2),
      'items': '3.2k',
    },
    {
      'icon': Icons.health_and_safety,
      'name': 'Health',
      'color': const Color(0xFF06B6D4),
      'bgColor': const Color(0xFFECFEFF),
      'items': '1.5k',
    },
    {
      'icon': Icons.time_to_leave,
      'name': 'Automotive',
      'color': const Color(0xFF64748B),
      'bgColor': const Color(0xFFF8FAFC),
      'items': '800',
    },
    {
      'icon': Icons.chair,
      'name': 'Furniture',
      'color': const Color(0xFFD946EF),
      'bgColor': const Color(0xFFFDF4FF),
      'items': '650',
    },
    {
      'icon': Icons.card_giftcard,
      'name': 'Gifts',
      'color': const Color(0xFFF97316),
      'bgColor': const Color(0xFFFFF7ED),
      'items': '1k+',
    },
    {
      'icon': Icons.pets,
      'name': 'Pets',
      'color': const Color(0xFFF59E0B),
      'bgColor': const Color(0xFFFEF3C7),
      'items': '450',
    },
    {
      'icon': Icons.edit,
      'name': 'Stationery',
      'color': const Color(0xFF10B981),
      'bgColor': const Color(0xFFD1FAE5),
      'items': '2.5k',
    },
    {
      'icon': Icons.build,
      'name': 'Tools',
      'color': const Color(0xFF6366F1),
      'bgColor': const Color(0xFFE0E7FF),
      'items': '1.8k',
    },
  ];

  String _searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final filteredCategories = _categories
        .where(
          (cat) => cat['name'].toString().toLowerCase().contains(
            _searchQuery.toLowerCase(),
          ),
        )
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // slightly softer background
      appBar: AppBar(
        title: const Text(
          'All Categories',
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontSize: 20,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.5,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFF0F172A)),
      ),
      body: CustomScrollView(
        slivers: [
          // Search Bar Sliver
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search,
                      color: Color(0xFF64748B),
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        onChanged: (val) {
                          setState(() {
                            _searchQuery = val;
                          });
                        },
                        style: const TextStyle(
                          fontSize: 15,
                          color: Color(0xFF0F172A),
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Search categories...',
                          hintStyle: TextStyle(
                            color: Color(0xFF94A3B8),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Categories Grid
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: filteredCategories.isEmpty
                ? const SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: Text(
                          'No categories found.',
                          style: TextStyle(
                            color: Color(0xFF64748B),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  )
                : SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // 2 columns for wider cards
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 1.1, // Adjust based on new design
                        ),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final category = filteredCategories[index];
                      return _buildCategoryCard(context, category);
                    }, childCount: filteredCategories.length),
                  ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context,
    Map<String, dynamic> category,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xCCE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: const Color(0x0A0F172A),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryProductsScreen(
                  categoryName: category['name'],
                  itemCount: category['items'],
                ),
              ),
            );
          },
          splashColor: category['color'].withOpacity(26 / 255),
          highlightColor: category['color'].withOpacity(13 / 255),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: category['bgColor'],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    category['icon'],
                    color: category['color'],
                    size: 28,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  category['name'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0F172A),
                    letterSpacing: -0.3,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '${category['items']} items',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
