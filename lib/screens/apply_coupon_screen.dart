import 'package:flutter/material.dart';

class ApplyCouponScreen extends StatefulWidget {
  const ApplyCouponScreen({super.key});

  @override
  State<ApplyCouponScreen> createState() => _ApplyCouponScreenState();
}

class _ApplyCouponScreenState extends State<ApplyCouponScreen> {
  final TextEditingController _promoController = TextEditingController();

  @override
  void dispose() {
    _promoController.dispose();
    super.dispose();
  }

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
          'Apply Coupon',
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Enter Promo Code Section
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Enter Promo Code',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 56,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFFF1F5F9),
                              width: 1.5,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _promoController,
                                  decoration: const InputDecoration(
                                    hintText: 'e.g. SAVE50',
                                    hintStyle: TextStyle(
                                      color: Color(0xFF94A3B8),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.confirmation_number_outlined,
                                color: Color(0xFF94A3B8),
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_promoController.text.trim().isNotEmpty) {
                              final code = _promoController.text.trim().toUpperCase();
                              double discount = 0;
                              if (code.contains('SAVE20') || code.contains('20')) {
                                discount = 0.20;
                              } else if (code.contains('SAVE15') || code.contains('15')) {
                                discount = 0.15;
                              } else if (code.contains('SAVE50') || code.contains('50')) {
                                discount = 0.50;
                              }

                              Navigator.pop(context, {
                                'code': code,
                                'discount': discount,
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please enter a promo code.'),
                                  backgroundColor: Colors.redAccent,
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF48221),
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Apply',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Available Coupons Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              color: const Color(0xFFF8FAFC),
              child: const Text(
                'AVAILABLE COUPONS',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF64748B),
                  letterSpacing: 0.5,
                ),
              ),
            ),

            // Coupons List
            _buildCouponItem(
              context,
              icon: Icons.percent,
              iconBgColor: const Color(0xFFFFF7ED),
              iconColor: const Color(0xFFF48221),
              title: '20% OFF',
              subtitle: 'On all electronics items',
              expiry: 'Expires on 31 Dec 2023',
              isVerified: true,
              buttonLabel: 'Apply',
            ),
            _buildDivider(),
            _buildCouponItem(
              context,
              icon: Icons.shopping_bag_outlined,
              iconBgColor: const Color(0xFFFFF7ED),
              iconColor: const Color(0xFFF48221),
              title: 'SAVE \$15',
              subtitle: 'Min. spend \$100',
              expiry: 'Expires on 15 Oct 2023',
              buttonLabel: 'Apply',
            ),
            _buildDivider(),
            _buildCouponItem(
              context,
              icon: Icons.rocket_launch_outlined,
              iconBgColor: const Color(0xFFFFF7ED),
              iconColor: const Color(0xFFF48221),
              title: 'FREE DELIVERY',
              subtitle: 'No minimum purchase',
              expiry: 'Expires on 20 Nov 2023',
              buttonLabel: 'Apply',
            ),
            _buildDivider(),
            _buildCouponItem(
              context,
              icon: Icons.celebration_outlined,
              iconBgColor: const Color(0xFFF1F5F9),
              iconColor: const Color(0xFF94A3B8),
              title: 'BIRTHDAY50',
              subtitle: 'Starts on your birthday',
              buttonLabel: 'Locked',
              isLocked: true,
            ),

            const SizedBox(height: 24),

            // Premium Promo Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF7ED),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFFFDE68A).withOpacity(128 / 255),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Want more deals?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFFF48221),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Join Kharid Do Premium to get exclusive early access to high-value coupons.',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF64748B),
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Learn More',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFFF48221),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildCouponItem(
    BuildContext context, {
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required String title,
    required String subtitle,
    String? expiry,
    bool isVerified = false,
    required String buttonLabel,
    bool isLocked = false,
  }) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: isLocked
                            ? const Color(0xFF64748B)
                            : const Color(0xFF0F172A),
                      ),
                    ),
                    if (isVerified) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFDCFCE7),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'VERIFIED',
                          style: TextStyle(
                            color: Color(0xFF15803D),
                            fontSize: 8,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF64748B),
                  ),
                ),
                if (expiry != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 12,
                        color: Color(0xFFCBD5E1),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        expiry,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF94A3B8),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            height: 36,
            child: ElevatedButton(
              onPressed:
                  isLocked
                      ? null
                      : () {
                        final String code = title.replaceFirst(' OFF', '').replaceAll('SAVE ', '').replaceAll(' ', '');
                        final String finalCode = code.startsWith('BIRTHDAY') ? code : (code.contains('%') ? 'SAVE${code.replaceAll('%', '')}' : code);
                        
                        double discount = 0;
                        if (finalCode.contains('20')) discount = 0.20;
                        if (finalCode.contains('15')) discount = 0.15;
                        if (finalCode.contains('50')) discount = 0.50;

                        Navigator.pop(context, {
                          'code': finalCode,
                          'discount': discount,
                        });
                      },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    isLocked ? const Color(0xFFF1F5F9) : const Color(0xFFF8FAFC),
                foregroundColor:
                    isLocked ? const Color(0xFF94A3B8) : const Color(0xFFF48221),
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                disabledBackgroundColor: const Color(0xFFF1F5F9),
              ),
              child: Text(
                buttonLabel,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Divider(color: Color(0xFFF1F5F9), height: 1),
    );
  }
}

