import 'package:flutter/material.dart';
import 'order_tracking_screen.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              // Custom Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, color: Color(0xFF0F172A)),
                    onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
                  ),
                  const Text(
                    'Order Confirmed',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(width: 48), // Spacer for centering title
                ],
              ),
              
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      // Success Circle
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(13 / 255),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Container(
                            width: 64,
                            height: 64,
                            decoration: const BoxDecoration(
                              color: Color(0xFFF48221),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 48),
                      // Illustration
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: AspectRatio(
                          aspectRatio: 1.5,
                          child: Image.asset(
                            'assets/images/delivery_success.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 48),
                      // Message
                      const Text(
                        'Order Placed\nSuccessfully!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF0F172A),
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 16),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFF64748B),
                            height: 1.5,
                            fontFamily: 'Outfit', // Assuming default or common font
                          ),
                          children: [
                            const TextSpan(text: 'Thank you for shopping with Kharid Do. Your order '),
                            TextSpan(
                              text: '#DZ-12345',
                              style: const TextStyle(
                                color: Color(0xFFF48221),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const TextSpan(text: ' has been confirmed and is being prepared.'),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 48),
                      // Track Order Button
                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OrderTrackingScreen(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.local_shipping_outlined, color: Colors.white),
                          label: const Text(
                            'Track My Order',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF48221),
                            elevation: 4,
                            shadowColor: const Color(0xFFF48221).withOpacity(100 / 255),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      // Back to Home Button
                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: TextButton.icon(
                          onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
                          icon: const Icon(Icons.home_filled, color: Color(0xFFF48221)),
                          label: const Text(
                            'Back to Home',
                            style: TextStyle(
                              color: Color(0xFFF48221),
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xFFFFF7ED),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Footer
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.verified_user_outlined, size: 16, color: const Color(0xFF0F172A).withOpacity(76 / 255)),
                    const SizedBox(width: 8),
                    Text(
                      'Secure Checkout Experience',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF0F172A).withOpacity(76 / 255),
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
  }
}
