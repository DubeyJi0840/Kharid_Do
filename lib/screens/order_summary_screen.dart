import 'package:flutter/material.dart';
import '../utils/mock_data.dart';
import '../utils/app_widgets.dart';
import 'order_success_screen.dart';

class OrderSummaryScreen extends StatefulWidget {
  const OrderSummaryScreen({super.key});

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  final TextEditingController _promoController = TextEditingController();
  double discount = 0.00;
  bool isPromoApplied = false;

  @override
  void dispose() {
    _promoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = MockData.cartItems;
    final double subtotal = MockData.subtotal;
    final double shipping = MockData.shipping;
    final double taxes = MockData.taxes;
    final double total = MockData.total - discount;

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
          'Order Summary',
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              // Progress Indicator Step 3 of 3
              const CheckoutProgressIndicator(currentStep: 3),
              const SizedBox(height: 24),
              // Shipping Address Section
              _buildSectionHeader(context, 'Shipping Address', 'Edit'),
              const SizedBox(height: 12),
              _buildInfoTile(
                icon: Icons.location_on_outlined,
                title: MockData.shippingAddress['title'],
                subtitle: MockData.shippingAddress['address'],
              ),

              const SizedBox(height: 32),
              // Payment Method Section
              _buildSectionHeader(context, 'Payment Method', 'Change'),
              const SizedBox(height: 12),
              _buildInfoTile(
                icon: Icons.credit_card_outlined,
                title: MockData.paymentMethod['cardHolder'],
                subtitle: MockData.paymentMethod['cardNumber'],
                trailingImage: 'assets/images/visa_logo.png',
              ),

              const SizedBox(height: 32),
              // Review Items Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Review Items',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  Text(
                    '${items.length} items',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF0F172A).withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ...items.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _buildItemTile(
                    name: item['name'],
                    variant: '${item['variant']} · Qty: ${item['quantity']}',
                    price: '\$${item['price'].toStringAsFixed(2)}',
                    imageIcon: item['image'],
                  ),
                ),
              ),

              const SizedBox(height: 16),
              // Price Breakdown
              _buildPriceRow('Subtotal', '\$${subtotal.toStringAsFixed(2)}'),
              _buildPriceRow(
                'Shipping Fee',
                shipping == 0 ? 'Free' : '\$${shipping.toStringAsFixed(2)}',
                isGreen: shipping == 0,
              ),
              _buildPriceRow('Estimated Taxes (5%)', '\$${taxes.toStringAsFixed(2)}'),
              _buildPriceRow(
                'Promo Discount',
                '-\$${discount.toStringAsFixed(2)}',
                isOrange: true,
              ),

              const SizedBox(height: 20),
              // Promo Code Input
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.sell_outlined,
                            size: 18,
                            color: Color(0xFF94A3B8),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              controller: _promoController,
                              decoration: const InputDecoration(
                                hintText: 'Promo code',
                                hintStyle: TextStyle(
                                  color: Color(0xFF94A3B8),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: isPromoApplied
                        ? null
                        : () {
                          if (_promoController.text.trim().isNotEmpty) {
                            setState(() {
                              discount = 15.00; // Simulated discount
                              isPromoApplied = true;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Promo code applied successfully!'),
                                backgroundColor: Color(0xFF10B981),
                              ),
                            );
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
                      backgroundColor: isPromoApplied
                          ? const Color(0xFFCBD5E1)
                          : const Color(0xFFE2E8F0),
                      foregroundColor: const Color(0xFF0F172A),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                    ),
                    child: Text(
                      isPromoApplied ? 'Applied' : 'Apply',
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),
              // Order Total
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF7ED),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFFF48221).withOpacity(0.1),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Order Total',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    Text(
                      '\$${total.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFFF48221),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              // Place Order Button
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OrderSuccessScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF48221),
                    elevation: 4,
                    shadowColor: const Color(0xFFF48221).withOpacity(0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Place Order',
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
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  'By clicking "Place Order", you agree to Kharid Do\'s terms of\nservice and privacy policy.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFF94A3B8),
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(
    BuildContext context,
    String title,
    String action,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Color(0xFF0F172A),
          ),
        ),
        TextButton(
          onPressed: () {
            if (title == 'Shipping Address') {
              Navigator.pop(context); // Go back to Shipping screen
            } else if (title == 'Payment Method') {
              Navigator.pop(context); // Go back to Payment screen (this is a simple implementation)
            }
          },
          child: Text(
            action,
            style: const TextStyle(
              color: Color(0xFFF48221),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String title,
    required String subtitle,
    String? trailingImage,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF7ED),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFFF48221), size: 20),
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
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF64748B),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          if (trailingImage != null)
            const Icon(
              Icons.credit_card,
              size: 24,
              color: Color(0xFFE2E8F0),
            ), // Proxy for logo
        ],
      ),
    );
  }

  Widget _buildItemTile({
    required String name,
    required String variant,
    required String price,
    required IconData imageIcon,
  }) {
    return Row(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Icon(
              imageIcon,
              color: const Color(0xFF94A3B8),
            ), // Proxy for images
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                variant,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF64748B),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF0F172A),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPriceRow(
    String label,
    String value, {
    bool isGreen = false,
    bool isOrange = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF64748B),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: isGreen
                  ? const Color(0xFF10B981)
                  : (isOrange
                        ? const Color(0xFFF48221)
                        : const Color(0xFF0F172A)),
            ),
          ),
        ],
      ),
    );
  }
}
