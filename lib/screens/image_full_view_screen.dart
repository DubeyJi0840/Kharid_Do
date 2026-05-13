import 'package:flutter/material.dart';

class ImageFullViewScreen extends StatefulWidget {
  final List<String> images;
  final int initialIndex;
  final String price;

  const ImageFullViewScreen({
    super.key,
    required this.images,
    this.initialIndex = 0,
    required this.price,
  });

  @override
  State<ImageFullViewScreen> createState() => _ImageFullViewScreenState();
}

class _ImageFullViewScreenState extends State<ImageFullViewScreen> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPrevious() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToNext() {
    if (_currentIndex < widget.images.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // Light off-white background
      body: SafeArea(
        child: Stack(
          children: [
            // Top Bar
            Positioned(
              top: 16,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, color: Color(0xFF0F172A)),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: Text(
                      '${_currentIndex + 1} / ${widget.images.length}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF334155),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.zoom_in,
                          color: Color(0xFF0F172A),
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.share, color: Color(0xFF0F172A)),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Center Image View
            Positioned(
              top: 100,
              bottom: 200, // Leave space for thumbnails and bottom buttons
              left: 0,
              right: 0,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemCount: widget.images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(10 / 255),
                            blurRadius: 40,
                            offset: const Offset(0, 10),
                          ),
                        ],
                        image: DecorationImage(
                          image: (widget.images[index].startsWith('http'))
                              ? NetworkImage(widget.images[index]) as ImageProvider
                              : AssetImage(widget.images[index]),
                          fit: BoxFit.contain, // Maintain aspect ratio without cropping
                        ),
                      ),
                      child: widget.images[index] == 'assets/images/placeholder.png'
                          ? Center(
                              child: Icon(
                                Icons.image,
                                size: 100,
                                color: Colors.grey.withOpacity(76 / 255),
                              ),
                            )
                          : null,
                    ),
                  );
                },
              ),
            ),

            // Arrow Controls (Left)
            if (_currentIndex > 0)
              Positioned(
                left: 16,
                top: 0,
                bottom: 100,
                child: Center(
                  child: GestureDetector(
                    onTap: _goToPrevious,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0F172A).withOpacity(128 / 255),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ),
              ),

            // Arrow Controls (Right)
            if (_currentIndex < widget.images.length - 1)
              Positioned(
                right: 16,
                top: 0,
                bottom: 100,
                child: Center(
                  child: GestureDetector(
                    onTap: _goToNext,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0F172A).withOpacity(128 / 255),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ),
              ),

            // Thumbnails
            Positioned(
              left: 0,
              right: 0,
              bottom: 110,
              child: SizedBox(
                height: 60,
                child: Center(
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.images.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final isSelected = _currentIndex == index;
                      return GestureDetector(
                        onTap: () {
                          _pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xFFF48221)
                                  : const Color(0xFFE2E8F0),
                              width: isSelected ? 2 : 1,
                            ),
                            image: DecorationImage(
                              image: (widget.images[index].startsWith('http'))
                                  ? NetworkImage(widget.images[index]) as ImageProvider
                                  : AssetImage(widget.images[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child:
                              widget.images[index] ==
                                  'assets/images/placeholder.png'
                              ? Center(
                                  child: Icon(
                                    Icons.image,
                                    size: 24,
                                    color: Colors.grey.withOpacity(76 / 255),
                                  ),
                                )
                              : null,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            // Bottom Buttons
            Positioned(
              left: 24,
              right: 24,
              bottom: 24,
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF48221),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Buy Now • ${widget.price}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.download,
                        color: Color(0xFF0F172A),
                      ),
                      onPressed: () {},
                      padding: const EdgeInsets.all(12),
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
}
