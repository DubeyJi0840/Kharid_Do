import 'package:flutter/material.dart';
import 'order_summary_screen.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Custom App Bar
            _buildAppBar(context),
            
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Order Info Header
                    _buildOrderHeader(),
                    
                    const SizedBox(height: 24),
                    
                    // Map/Graphic Section
                    _buildMapSection(),
                    
                    const SizedBox(height: 16),
                    
                    // Delivery Partner Info
                    _buildDeliveryPartnerInfo(),
                    
                    const SizedBox(height: 24),
                    
                    // Delivery Status Section
                    _buildDeliveryStatus(),
                    
                    const SizedBox(height: 24),
                    
                    // Info Banner
                    _buildInfoBanner(),
                    
                    const SizedBox(height: 32),
                    
                    // View Order Details Button
                    _buildViewOrderDetailsButton(context),
                    
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFFF7ED),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFFF48221)),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          const Text(
            'Track Your Order',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xFF0F172A),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFFF7ED),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.help_outline, color: Color(0xFFF48221)),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ORDER ID',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF64748B),
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                '#DZ-8821940',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF0F172A),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'ESTIMATED DELIVERY',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF64748B),
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Today, 4:30 PM',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFFF48221),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMapSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Stylized graphic representing a path
                Container(
                  width: 180,
                  height: 120,
                  decoration: BoxDecoration(
                    color: const Color(0xFFBEF264).withOpacity(100 / 255),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(100),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Pins and Path
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Column(
              children: [
                const Icon(Icons.location_on, color: Color(0xFFF43F5E), size: 48),
              ],
            ),
          ),
          // Wavy line simulation
          Positioned(
            top: 80,
            left: 100,
            child: Container(
              width: 60,
              height: 80,
              child: const CustomPaint(
                painter: PathPainter(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryPartnerInfo() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(15 / 255),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: const Color(0xFFF1F5F9),
                child: ClipOval(
                  child: Image.network(
                    'https://ui-avatars.com/api/?name=Marco+Rodriguez&background=random',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 2,
                right: 2,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Marco Rodriguez',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF0F172A),
                  ),
                ),
                Text(
                  'Your Delivery Partner',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFF48221),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.call, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.chat_bubble, color: Color(0xFF0F172A), size: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryStatus() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 18,
                decoration: BoxDecoration(
                  color: const Color(0xFFF48221),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Delivery Status',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF0F172A),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildStatusStep(
            'Order Placed',
            'August 24, 2023 - 10:15 AM',
            isCompleted: true,
            isFirst: true,
          ),
          _buildStatusStep(
            'Packed',
            'August 24, 2023 - 02:30 PM',
            isCompleted: true,
          ),
          _buildStatusStep(
            'Shipped',
            'In transit to your location',
            subtitle: 'Last update: 5 mins ago',
            isCurrent: true,
          ),
          _buildStatusStep(
            'Out for Delivery',
            'Pending',
            isPending: true,
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _buildStatusStep(
    String title,
    String time, {
    String? subtitle,
    bool isCompleted = false,
    bool isCurrent = false,
    bool isPending = false,
    bool isFirst = false,
    bool isLast = false,
  }) {
    Widget icon;

    if (isCompleted) {
      icon = const Icon(Icons.check, color: Colors.white, size: 16);
    } else if (isCurrent) {
      icon = const Icon(Icons.local_shipping, color: Colors.white, size: 16);
    } else {
      icon = const Icon(Icons.home, color: Color(0xFF94A3B8), size: 16);
    }

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: isCompleted || isCurrent ? const Color(0xFFF48221) : const Color(0xFFF1F5F9),
                  shape: BoxShape.circle,
                ),
                child: Center(child: icon),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: (isCompleted) ? const Color(0xFFF48221) : const Color(0xFFE2E8F0),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: isPending ? const Color(0xFF94A3B8) : const Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isCurrent ? const Color(0xFFF48221) : const Color(0xFF64748B),
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF94A3B8),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7ED),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFFEE2E2).withOpacity(0), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.info, color: Color(0xFFF48221), size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Your package is currently with our partner carrier. You will receive a final SMS notification when Marco is 5 minutes away.',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF64748B),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildViewOrderDetailsButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        width: double.infinity,
        height: 60,
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
          ),
          child: const Text(
            'View Order Details',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class PathPainter extends CustomPainter {
  const PathPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF334155)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(10, 0);
    path.quadraticBezierTo(40, 15, 10, 30);
    path.quadraticBezierTo(-10, 45, 20, 60);
    path.quadraticBezierTo(40, 75, 20, 80);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
