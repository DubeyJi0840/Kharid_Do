import 'dart:ui';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> onboardingData = [
    {
      "title": "Discover\nBest Deals",
      "subtitle":
          "Find the most exclusive deals on top brands, all in one place. Handpicked just for you.",
      "icon": Icons.local_mall_rounded,
    },
    {
      "title": "Easy & Safe\nPayment",
      "subtitle":
          "Seamlessly pay for your items with our secure payment options. Guaranteed 100% safe.",
      "icon": Icons.credit_card_rounded,
    },
    {
      "title": "Lightning Fast\nDelivery",
      "subtitle":
          "Get your favorite deals delivered right to your doorstep quickly, tracked in real-time.",
      "icon": Icons.flash_on_rounded,
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNext() {
    if (_currentPage < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      _onSkip();
    }
  }

  void _onSkip() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const LoginScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 600),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // Light premium background
      body: Stack(
        children: [
          // Background Animation Orbs
          AnimatedPositioned(
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeInOutBack,
            top: _currentPage == 0
                ? -100
                : _currentPage == 1
                ? 200
                : -50,
            left: _currentPage == 0
                ? -100
                : _currentPage == 1
                ? -150
                : 150,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFF48221).withOpacity(0.35),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOutBack,
            bottom: _currentPage == 0
                ? 100
                : _currentPage == 1
                ? -100
                : 250,
            right: _currentPage == 0
                ? -50
                : _currentPage == 1
                ? 150
                : -100,
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF3B82F6).withOpacity(0.25),
              ),
            ),
          ),
          // Deep Blur layer for Frosted background
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
            child: Container(color: Colors.transparent),
          ),

          SafeArea(
            child: Column(
              children: [
                // Top Bar
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 16.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF48221),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(
                                    0xFFF48221,
                                  ).withOpacity(0.3),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'Kharid Do',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF0F172A),
                              letterSpacing: -0.5,
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: _onSkip,
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: Colors.white.withOpacity(0.6),
                        ),
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF64748B),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Main Content
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    itemCount: onboardingData.length,
                    itemBuilder: (context, index) {
                      return _buildPageContent(
                        title: onboardingData[index]["title"],
                        subtitle: onboardingData[index]["subtitle"],
                        icon: onboardingData[index]["icon"],
                        index: index,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageContent({
    required String title,
    required String subtitle,
    required IconData icon,
    required int index,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(flex: 2),
                    // Large floating center graphic
                    Center(
                      child: TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0.8, end: 1.0),
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeOutBack,
                        builder: (context, double scale, child) {
                          return Transform.scale(
                            scale: scale,
                            child: Container(
                              width: 260,
                              height: 260,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.5),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.8),
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.04),
                                    blurRadius: 30,
                                    offset: const Offset(0, 15),
                                  ),
                                ],
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  // Inner colored circle with energetic gradient
                                  Container(
                                    width: 190,
                                    height: 190,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFFFF9D4A),
                                          Color(0xFFF48221),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(
                                            0xFFF48221,
                                          ).withOpacity(0.4),
                                          blurRadius: 20,
                                          offset: const Offset(0, 10),
                                        ),
                                      ],
                                    ),
                                    child: Icon(
                                      icon,
                                      size: 80,
                                      color: Colors.white,
                                    ),
                                  ),
                                  // Small decorative geometric shapes
                                  Positioned(
                                    top: 25,
                                    right: 45,
                                    child: Container(
                                      width: 16,
                                      height: 16,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF3B82F6),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 35,
                                    left: 35,
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF22C55E),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const Spacer(flex: 2),

                    // Bottom Premium Glass Card
                    ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 36,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.65),
                            borderRadius: BorderRadius.circular(32),
                            border: Border.all(color: Colors.white, width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 24,
                                offset: const Offset(0, -8),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                title,
                                style: const TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.w900,
                                  height: 1.1,
                                  color: Color(0xFF0F172A),
                                  letterSpacing: -1,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                subtitle,
                                style: const TextStyle(
                                  fontSize: 16,
                                  height: 1.6,
                                  color: Color(0xFF475569),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 48),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Dots
                                  Row(
                                    children: List.generate(
                                      onboardingData.length,
                                      (index) => _buildDot(index: index),
                                    ),
                                  ),
                                  // Dark Premium Next Button
                                  GestureDetector(
                                    onTap: _onNext,
                                    child: AnimatedContainer(
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      width:
                                          _currentPage ==
                                              onboardingData.length - 1
                                          ? 150
                                          : 64,
                                      height: 64,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF0F172A),
                                        borderRadius: BorderRadius.circular(32),
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(
                                              0xFF0F172A,
                                            ).withOpacity(0.3),
                                            blurRadius: 16,
                                            offset: const Offset(0, 8),
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child:
                                            _currentPage ==
                                                onboardingData.length - 1
                                            ? const Text(
                                                'Get Started',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              )
                                            : const Icon(
                                                Icons.arrow_forward_rounded,
                                                color: Colors.white,
                                                size: 28,
                                              ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
      margin: const EdgeInsets.only(right: 8.0),
      width: _currentPage == index ? 32 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: _currentPage == index
            ? const Color(0xFFF48221)
            : const Color(0xFF94A3B8).withOpacity(0.4),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
