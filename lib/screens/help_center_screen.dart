import 'package:flutter/material.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, String>> _faqs = [
    {
      'question': 'How do I track my order?',
      'answer': 'You can track your order in the "My Orders" section under your profile. Once your order has been shipped, you will also receive an email with a tracking link.',
    },
    {
      'question': 'What is your return policy?',
      'answer': 'We offer a 30-day hassle-free return policy. If you are not satisfied with your purchase, you can return it within 30 days of delivery for a full refund or exchange.',
    },
    {
      'question': 'How long does shipping take?',
      'answer': 'Standard shipping usually takes 3-5 business days. Expedited shipping options are available at checkout for faster delivery.',
    },
    {
      'question': 'Can I change my shipping address after placing an order?',
      'answer': 'You can change your shipping address within 1 hour of placing the order. Please contact our customer support immediately to request a change.',
    },
    {
      'question': 'How do I use a voucher?',
      'answer': 'During checkout, enter your promo code in the "Apply Voucher" field and tap "Apply". The discount will be automatically deducted from your total amount.',
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
          'Help Center',
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
              Tab(text: 'FAQ'),
              Tab(text: 'Contact Us'),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildFAQTab(),
          _buildContactUsTab(),
        ],
      ),
    );
  }

  Widget _buildFAQTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          // Search Field
          TextField(
            decoration: InputDecoration(
              hintText: 'Search for articles...',
              hintStyle: const TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
              prefixIcon: const Icon(Icons.search, color: Color(0xFF94A3B8)),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Color(0xFFF48221)),
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Categories
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildCategoryChip('General', isSelected: true),
                _buildCategoryChip('Account'),
                _buildCategoryChip('Service'),
                _buildCategoryChip('Payment'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Accordion List
          ..._faqs.map((faq) => _buildFAQItem(faq)).toList(),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFF48221) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? const Color(0xFFF48221) : const Color(0xFFE2E8F0),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : const Color(0xFF0F172A),
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }

  Widget _buildFAQItem(Map<String, String> faq) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: ExpansionTile(
        title: Text(
          faq['question']!,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
        ),
        iconColor: const Color(0xFFF48221),
        collapsedIconColor: const Color(0xFF94A3B8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Text(
              faq['answer']!,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF64748B),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactUsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          _buildContactCard(
            icon: Icons.headset_mic_rounded,
            title: 'Customer Service',
            subtitle: 'Live Chat with our support team',
            color: const Color(0xFFF48221),
            onTap: () {},
          ),
          const SizedBox(height: 16),
          _buildContactCard(
            icon: Icons.phone_rounded,
            title: 'Call Us',
            subtitle: 'Speak directly with an agent\n+1 (800) 123-4567',
            color: const Color(0xFF10B981),
            onTap: () {},
          ),
          const SizedBox(height: 16),
          _buildContactCard(
            icon: Icons.email_rounded,
            title: 'Email Us',
            subtitle: 'Send us an email, we will reply within 24h\nsupport@kharidDo.com',
            color: const Color(0xFF3B82F6),
            onTap: () {},
          ),
          const SizedBox(height: 40),
          // Social Media links (common for international apps)
          const Text(
            'Follow Us',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialIcon(Icons.camera_alt), // Instagram analogue
              const SizedBox(width: 16),
              _buildSocialIcon(Icons.facebook),
              const SizedBox(width: 16),
              _buildSocialIcon(Icons.ondemand_video), // YouTube analogue
            ],
          )
        ],
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
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
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Center(
        child: Icon(icon, color: const Color(0xFF64748B), size: 24),
      ),
    );
  }
}
