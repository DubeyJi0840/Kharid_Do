import 'package:flutter/material.dart';
import 'image_full_view_screen.dart';
import 'cart_screen.dart';
import 'store_profile_screen.dart';
import 'reviews_screen.dart';
import 'messages_screen.dart';
import '../utils/mock_data.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _selectedColorIndex = 0;
  int _selectedSizeIndex = 0;

  final List<Color> _colors = [
    const Color(0xFF334155), // Dark Grey
    const Color(0xFFCBD5E1), // Light Blue/Grey
  ];

  final List<String> _sizes = ['14"', '16"'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF0F172A)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Product Details',
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Color(0xFF0F172A)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        final dynamic productImage = widget.product['image'];
                        return ImageFullViewScreen(
                          images: [
                            if (productImage is String) productImage else 'assets/images/placeholder.png',
                            'assets/images/placeholder.png',
                            'assets/images/placeholder.png',
                          ],
                          price: widget.product['dealPrice'] ?? '\$0.00',
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(20),
                  ),
child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: () {
                      final image = widget.product['image'];
                      if (image == null) {
                        return const Center(
                          child: Icon(
                            Icons.image,
                            size: 80,
                            color: Color(0xFFCBD5E1),
                          ),
                        );
                      }
                      if (image is String) {
                        if (image.startsWith('assets/')) {
                          return Image.asset(
                            image,
                            fit: BoxFit.cover,
                            errorBuilder:
                                (context, error, stackTrace) => const Center(
                                  child: Icon(
                                    Icons.image,
                                    size: 80,
                                    color: Color(0xFFCBD5E1),
                                  ),
                                ),
                          );
                        } else if (image.startsWith('http')) {
                          return Image.network(
                            image,
                            fit: BoxFit.cover,
                            errorBuilder:
                                (context, error, stackTrace) => const Center(
                                  child: Icon(
                                    Icons.image,
                                    size: 80,
                                    color: Color(0xFFCBD5E1),
                                  ),
                                ),
                          );
                        }
                      } else if (image is IconData) {
                        return Center(
                          child:
                              Icon(image, size: 80, color: const Color(0xFF94A3B8)),
                        );
                      }
                      return const Center(
                        child: Icon(
                          Icons.image,
                          size: 80,
                          color: Color(0xFFCBD5E1),
                        ),
                      );
                    }(),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Badges
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF7ED),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'TOP RATED',
                      style: TextStyle(
                        color: Color(0xFFF48221),
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF7ED),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.star, color: Color(0xFFF48221), size: 14),
                        SizedBox(width: 4),
                        Text(
                          '4.8',
                          style: TextStyle(
                            color: Color(0xFFF48221),
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Title
              Text(
                widget.product['name'] ?? 'Product Name',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF0F172A),
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 12),

              // Price
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.product['dealPrice'] ?? '\$0.00',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: const Color(0xFFF48221),
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(width: 12),
                  if (widget.product['originalPrice'] != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Text(
                        widget.product['originalPrice'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF94A3B8),
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 32),

              // Color
              const Text(
                'Color',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: List.generate(
                  _colors.length,
                  (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedColorIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _colors[index],
                        border: Border.all(
                          color: _selectedColorIndex == index
                              ? const Color(0xFFF48221)
                              : Colors.transparent,
                          width: 2,
                        ),
                        boxShadow: [
                          if (_selectedColorIndex == index)
                            BoxShadow(
                              color: const Color(
                                0xFFF48221,
                              ).withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _colors[index],
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Display Size
              const Text(
                'Display Size',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: List.generate(
                  _sizes.length,
                  (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedSizeIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: _selectedSizeIndex == index
                              ? const Color(0xFFF48221)
                              : const Color(0xFFE2E8F0),
                          width: 1.5,
                        ),
                      ),
                      child: Text(
                        _sizes[index],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: _selectedSizeIndex == index
                              ? const Color(0xFFF48221)
                              : const Color(0xFF475569),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              const Divider(color: Color(0xFFF1F5F9), thickness: 1, height: 1),
              const SizedBox(height: 16),
              _buildStoreSection(),
              const SizedBox(height: 16),
              const Divider(color: Color(0xFFF1F5F9), thickness: 1, height: 1),
              const SizedBox(height: 24),

              // Description
              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                widget.product['description'] ??
                    'The new MacBook Pro delivers game-changing performance for pro users. Choose the powerful M2 Pro or the even more powerful M2 Max to supercharge pro-level workflows while getting amazing battery life...',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF64748B),
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () {},
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Read more',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFF48221),
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xFFF48221),
                      size: 16,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const Divider(color: Color(0xFFF1F5F9), thickness: 1, height: 1),
              const SizedBox(height: 24),

              // Reviews
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Reviews (128)',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReviewsScreen(productName: widget.product['name'] ?? 'Product')),
                      );
                    },
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFF48221),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              _buildReviewCard(
                'Alex Johnson',
                'Best laptop I\'ve ever owned. The screen is absolutely incredible for video editing.',
                5.0,
              ),
              const SizedBox(height: 12),
              _buildReviewCard(
                'Sarah M.',
                'Pricey but worth every penny for the performance boost in my dev workflow.',
                5.0,
              ),

              // Add some space at the bottom for the fixed CTA area
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: const Border(top: BorderSide(color: Color(0xFFF1F5F9))),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MessagesScreen()));
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF7ED),
                    border: Border.all(color: const Color(0xFFF48221)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.chat_bubble_outline, color: Color(0xFFF48221)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 1,
                child: OutlinedButton(
                  onPressed: () {
                    // Actual bug fix: Add product to MockData.cartItems
                    final existingIndex = MockData.cartItems.indexWhere((item) => item['id'] == widget.product['id']);
                    final priceString = widget.product['dealPrice']?.toString() ?? '0';
                    final numericPrice = double.tryParse(priceString.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0;
                    
                    if (existingIndex != -1) {
                      MockData.cartItems[existingIndex]['quantity'] = (MockData.cartItems[existingIndex]['quantity'] as int) + 1;
                    } else {
                      MockData.cartItems.add({
                        'id': widget.product['id'] ?? DateTime.now().millisecondsSinceEpoch.toString(),
                        'name': widget.product['name'] ?? 'Unknown Product',
                        'variant': 'Selected Variant',
                        'price': numericPrice,
                        'quantity': 1,
                        'image': widget.product['image'] ?? Icons.shopping_bag_outlined,
                      });
                    }
                    
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Added to Cart!'),
                        backgroundColor: Color(0xFF10B981),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: const BorderSide(
                      color: Color(0xFFF48221),
                      width: 1.5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        color: Color(0xFFF48221),
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Add to Cart',
                        style: TextStyle(
                          color: Color(0xFFF48221),
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF48221),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Buy Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReviewCard(String name, String content, double rating) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF0F172A),
                ),
              ),
              Row(
                children: List.generate(
                  5,
                  (index) => const Icon(
                    Icons.star,
                    color: Color(0xFFF48221),
                    size: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xFF64748B),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoreSection() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: const Color(0xFFF1F5F9),
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: const Icon(Icons.storefront, color: Color(0xFFF48221)),
      ),
      title: const Text('Tech Haven Official', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      subtitle: Row(
        children: const [
          Icon(Icons.star, color: Color(0xFFFBBF24), size: 14),
          SizedBox(width: 4),
          Text('4.8  |  142K Followers', style: TextStyle(fontSize: 12, color: Color(0xFF64748B))),
        ],
      ),
      trailing: OutlinedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const StoreProfileScreen()));
        },
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(0xFFF48221),
          side: const BorderSide(color: Color(0xFFF48221)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        child: const Text('View Store', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
      ),
    );
  }
}
