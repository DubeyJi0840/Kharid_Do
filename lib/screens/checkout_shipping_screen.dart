import 'package:flutter/material.dart';
import '../utils/mock_data.dart';
import '../utils/app_widgets.dart';
import 'checkout_payment_screen.dart';
import 'manage_addresses_screen.dart';
import 'package:flutter/material.dart';
import '../utils/mock_data.dart';
import '../utils/app_widgets.dart';
import 'checkout_payment_screen.dart';
import 'manage_addresses_screen.dart';

class CheckoutShippingScreen extends StatefulWidget {
  const CheckoutShippingScreen({super.key});

  @override
  State<CheckoutShippingScreen> createState() => _CheckoutShippingScreenState();
}

class _CheckoutShippingScreenState extends State<CheckoutShippingScreen> {
  int _selectedAddressIndex = 0;

  final List<Map<String, dynamic>> _addresses = [
    {
      'type': 'Home',
      'icon': Icons.home,
      'address': '123 Maple Street, Apt 4B\nSpringfield, IL 62704',
      'isDefault': true,
    },
    {
      'type': 'Office',
      'icon': Icons.business_center,
      'address': '456 Business Blvd, Suite 200\nChicago, IL 60601',
      'isDefault': false,
    },
    {
      'type': 'Parents\' House',
      'icon': Icons.people_outline,
      'address': '789 Oak Lane\nNaperville, IL 60540',
      'isDefault': false,
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
          'Checkout',
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
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
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
                    // Progress Indicator Step 1 of 3
                    const CheckoutProgressIndicator(currentStep: 1),

                    const SizedBox(height: 32),

                    // Saved Addresses Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Saved Addresses',
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
                                builder: (context) => const ManageAddressesScreen(),
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

                    // Address List
                    ...List.generate(_addresses.length, (index) {
                      final address = _addresses[index];
                      final isSelected = _selectedAddressIndex == index;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: GestureDetector(
                          onTap: () =>
                              setState(() => _selectedAddressIndex = index),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFFFFF7ED)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: isSelected
                                    ? const Color(0xFFF48221)
                                    : const Color(0xFFF1F5F9),
                                width: 1.5,
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  isSelected
                                      ? Icons.radio_button_checked
                                      : Icons.radio_button_off,
                                  color: isSelected
                                      ? const Color(0xFFF48221)
                                      : const Color(0xFFCBD5E1),
                                  size: 24,
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            address['icon'],
                                            color: const Color(0xFF64748B),
                                            size: 20,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            address['type'],
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w800,
                                              color: Color(0xFF0F172A),
                                            ),
                                          ),
                                          if (address['isDefault']) ...[
                                            const SizedBox(width: 8),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 8,
                                                    vertical: 2,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFF48221),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: const Text(
                                                'DEFAULT',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        address['address'],
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF64748B),
                                          height: 1.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),

                    // Add New Address Button
                    CustomPaint(
                      painter: DashedBorderPainter(
                        color: const Color(0xFFCBD5E1),
                        strokeWidth: 1.5,
                        gap: 4,
                        borderRadius: 16,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 56,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ManageAddressesScreen(),
                              ),
                            );
                          },
                          borderRadius: BorderRadius.circular(16),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_location_alt,
                                color: Color(0xFF475569),
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Add New Address',
                                style: TextStyle(
                                  color: Color(0xFF475569),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Map View Container
                    Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage(
                            'assets/images/placeholder.png',
                          ), // placeholder for map
                          fit: BoxFit.cover,
                          opacity: 0.2,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.map_outlined,
                          size: 40,
                          color: Color(0xFF94A3B8),
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),

          // Bottom Payment Section
          Container(
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
                          const Text(
                            'Total Amount',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF94A3B8),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '\$${MockData.total.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF0F172A),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'Delivery',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF94A3B8),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            MockData.shipping == 0 ? 'Free Shipping' : '\$${MockData.shipping.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: MockData.shipping == 0 ? const Color(0xFF10B981) : const Color(0xFF0F172A),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CheckoutPaymentScreen(),
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
                            'Continue to Payment',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

