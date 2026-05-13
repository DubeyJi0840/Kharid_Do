import 'package:flutter/material.dart';

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;
  final double borderRadius;

  DashedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.gap,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(borderRadius),
        ),
      );

    final dashPath = Path();
    const dashWidth = 4.0;
    final dashGap = gap;
    double distance = 0.0;

    for (final pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        dashPath.addPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth + dashGap;
      }
      distance = 0.0;
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CheckoutProgressIndicator extends StatelessWidget {
  final int currentStep;
  const CheckoutProgressIndicator({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          _buildStepCircle(1, 'Address', isCompleted: currentStep > 1, isActive: currentStep == 1),
          Expanded(child: Container(height: 2, color: currentStep >= 2 ? const Color(0xFFF48221) : const Color(0xFFE2E8F0))),
          _buildStepCircle(2, 'Payment', isCompleted: currentStep > 2, isActive: currentStep == 2),
          Expanded(child: Container(height: 2, color: currentStep >= 3 ? const Color(0xFFF48221) : const Color(0xFFE2E8F0))),
          _buildStepCircle(3, 'Review', isActive: currentStep == 3),
        ],
      ),
    );
  }

  Widget _buildStepCircle(
    int step,
    String label, {
    bool isCompleted = false,
    bool isActive = false,
  }) {
    final Color color = isCompleted || isActive ? const Color(0xFFF48221) : const Color(0xFFE2E8F0);
    return Column(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: isCompleted || isActive ? const Color(0xFFF48221) : Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: color,
              width: 2,
            ),
          ),
          child: Center(
            child: isCompleted
                ? const Icon(Icons.check, size: 16, color: Colors.white)
                : Text(
                    step.toString(),
                    style: TextStyle(
                      color: isActive ? Colors.white : const Color(0xFF94A3B8),
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: isActive || isCompleted ? FontWeight.w800 : FontWeight.w600,
            color: isActive || isCompleted ? const Color(0xFFF48221) : const Color(0xFF94A3B8),
          ),
        ),
      ],
    );
  }
}
