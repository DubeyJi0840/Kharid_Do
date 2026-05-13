import 'package:flutter/material.dart';
import '../utils/mock_data.dart';
import '../utils/app_widgets.dart';
import 'order_summary_screen.dart';
import 'payment_methods_screen.dart';

class CheckoutPaymentScreen extends StatefulWidget {
  const CheckoutPaymentScreen({super.key});

  @override
  State<CheckoutPaymentScreen> createState() => _CheckoutPaymentScreenState();
}

class _CheckoutPaymentScreenState extends State<CheckoutPaymentScreen> {
  int _selectedPaymentMethod = 2; // Default to COD for this mock
  int _selectedCardIndex = 0;

  final List<Map<String, dynamic>> _savedCards = [
    {
      'holder': 'Aditya Narayan',
      'number': '**** 4242',
      'expiry': '12/26',
      'type': 'VISA',
      'color': const Color(0xFF1E293B), // Dark blue/slate
    },
    {
      'holder': 'Dubey Ji',
      'number': '**** 8888',
      'expiry': '05/27',
      'type': 'MASTERCARD',
      'color': const Color(0xFFF48221), // Primary Orange
    },
  ];

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
          'Payment Method',
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    // Progress Indicator
                    const CheckoutProgressIndicator(currentStep: 2),

                    const SizedBox(height: 32),

                    // Saved Cards Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Saved Cards',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PaymentMethodsScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Edit',
                            style: TextStyle(
                              color: Color(0xFFF48221),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Cards Horizontal List
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 190,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _savedCards.length,
                        itemBuilder: (context, index) {
                          return _buildCreditCard(_savedCards[index], index);
                        },
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Add New Card Button
                    _buildAddCardButton(),

                    const SizedBox(height: 32),

                    // Other Payment Methods
                    const Text(
                      'Other Payment Methods',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 16),

                    _buildPaymentMethodTile(
                      0,
                      'UPI (Google Pay, PhonePe)',
                      'Pay instantly via your UPI ID',
                      Icons.account_balance_wallet_outlined,
                    ),
                    _buildPaymentMethodTile(
                      1,
                      'Net Banking',
                      'Select from list of banks',
                      Icons.account_balance_outlined,
                    ),
                    _buildPaymentMethodTile(
                      2,
                      'Cash on Delivery (COD)',
                      'Pay when you receive the order',
                      Icons.payments_outlined,
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),

          // Bottom Section
          _buildBottomSection(),
        ],
      ),
    );
  }



  Widget _buildCreditCard(Map<String, dynamic> card, int index) {
    bool isSelected = _selectedCardIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedCardIndex = index),
      child: Container(
        width: 280,
        margin: const EdgeInsets.only(right: 16, top: 4, bottom: 4),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: card['color'],
          borderRadius: BorderRadius.circular(20),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: card['color'].withOpacity(100 / 255),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ]
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.contactless_outlined,
                  color: Colors.white,
                  size: 28,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(51 / 255),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    card['type'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'CARD HOLDER',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  card['holder'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  card['number'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                  ),
                ),
                Text(
                  card['expiry'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddCardButton() {
    return CustomPaint(
      painter: DashedBorderPainter(
        color: const Color(0xFFF48221),
        strokeWidth: 1.5,
        gap: 4,
        borderRadius: 16,
      ),
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          color: const Color(0xFFFFF7ED),
          borderRadius: BorderRadius.circular(16),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PaymentMethodsScreen(),
              ),
            );
          },
          borderRadius: BorderRadius.circular(16),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_circle, color: Color(0xFFF48221)),
              SizedBox(width: 8),
              Text(
                'Add New Card',
                style: TextStyle(
                  color: Color(0xFFF48221),
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethodTile(
    int index,
    String title,
    String subtitle,
    IconData icon,
  ) {
    bool isSelected = _selectedPaymentMethod == index;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: GestureDetector(
        onTap: () => setState(() => _selectedPaymentMethod = index),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected
                  ? const Color(0xFFF48221)
                  : const Color(0xFFF1F5F9),
              width: 1.5,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: const Color(0xFFF48221).withOpacity(20 / 255),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF7ED),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: const Color(0xFFF48221), size: 24),
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
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF94A3B8),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                isSelected
                    ? Icons.radio_button_checked
                    : Icons.radio_button_off,
                color: isSelected
                    ? const Color(0xFFF48221)
                    : const Color(0xFFCBD5E1),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border(top: BorderSide(color: Color(0xFFF1F5F9))),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(13 / 255),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Amount',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF94A3B8),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '\$${MockData.total.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View Details',
                    style: TextStyle(
                      color: Color(0xFFF48221),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OrderSummaryScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF48221),
                  elevation: 4,
                  shadowColor: const Color(0xFFF48221).withOpacity(100 / 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Continue to Review',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
