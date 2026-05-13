import 'package:flutter/material.dart';

class ReviewsScreen extends StatefulWidget {
  final String productName;
  final String productRating;
  final String totalReviews;

  const ReviewsScreen({
    super.key,
    this.productName = 'Product Reviews',
    this.productRating = '4.8',
    this.totalReviews = '128',
  });

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  int _selectedFilterIndex = 0;
  final List<String> _filters = ['All', 'With Photo', '5 Star', '4 Star', '3 Star', '2 Star', '1 Star'];

  final List<Map<String, dynamic>> _reviews = [
    {
      'name': 'Shivam Verma',
      'date': '12 Oct 2023',
      'rating': 5.0,
      'content': 'Absolutely love this product! The quality is amazing and it arrived exactly as described. Worth every penny. Highly recommended to anyone looking for a reliable gadget.',
      'images': [Icons.image, Icons.image],
      'helpful': 24,
    },
    {
      'name': 'Saurav Darshan',
      'date': '05 Oct 2023',
      'rating': 4.0,
      'content': 'Good product, nice packaging. Works exactly as intended. I only gave it 4 stars because the delivery was slightly delayed. Other than that, perfect!',
      'images': [],
      'helpful': 8,
    },
    {
      'name': 'Santosh Pagal',
      'date': '28 Sep 2023',
      'rating': 5.0,
      'content': 'Exceeded my expectations in every way.',
      'images': [Icons.image],
      'helpful': 42,
    },
  ];

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
        title: Text(
          widget.productName,
          style: const TextStyle(
            color: Color(0xFF0F172A),
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Row(
              children: [
                const Icon(Icons.star, color: Color(0xFFFBBF24), size: 24),
                const SizedBox(width: 8),
                Text(
                  '${widget.productRating} / 5',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'based on ${widget.totalReviews} reviews',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Filters
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: List.generate(_filters.length, (index) {
                  final isSelected = _selectedFilterIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedFilterIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFFFFF7ED) : const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected ? const Color(0xFFF48221) : Colors.transparent,
                        ),
                      ),
                      child: Text(
                        _filters[index],
                        style: TextStyle(
                          color: isSelected ? const Color(0xFFF48221) : const Color(0xFF64748B),
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          // Reviews List
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(24),
              itemCount: _reviews.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                return _buildReviewItem(_reviews[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem(Map<String, dynamic> review) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: const Color(0xFFF1F5F9),
                    child: Text(
                      review['name'][0],
                      style: const TextStyle(
                        color: Color(0xFF0F172A),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    review['name'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                ],
              ),
              Text(
                review['date'],
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF94A3B8),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                index < review['rating'] ? Icons.star : Icons.star_border,
                color: const Color(0xFFFBBF24),
                size: 16,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            review['content'],
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF475569),
              height: 1.5,
            ),
          ),
          if ((review['images'] as List).isNotEmpty) ...[
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: (review['images'] as List).map((iconItem) {
                  return Container(
                    margin: const EdgeInsets.only(right: 8),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8FAFC),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: Icon(iconItem as IconData, color: const Color(0xFFCBD5E1), size: 24),
                  );
                }).toList(),
              ),
            ),
          ],
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.thumb_up_alt_outlined, size: 14, color: Color(0xFF64748B)),
                    const SizedBox(width: 4),
                    Text(
                      'Helpful (${review['helpful']})',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF64748B),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
