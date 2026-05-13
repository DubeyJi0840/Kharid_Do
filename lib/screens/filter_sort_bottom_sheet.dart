import 'package:flutter/material.dart';

class FilterSortBottomSheet extends StatefulWidget {
  const FilterSortBottomSheet({super.key});

  @override
  State<FilterSortBottomSheet> createState() => _FilterSortBottomSheetState();
}

class _FilterSortBottomSheetState extends State<FilterSortBottomSheet> {
  String _selectedSort = 'Newest First';
  RangeValues _priceRange = const RangeValues(50, 1200);

  final List<String> _sortOptions = [
    'Newest First',
    'Price: Low to High',
    'Price: High to Low',
    'Most Popular',
  ];

  final Map<String, bool> _selectedBrands = {
    'Apple': true,
    'Samsung': true,
    'Sony': false,
    'Microsoft': false,
  };

  final Map<String, int> _brandCounts = {
    'Apple': 124,
    'Samsung': 89,
    'Sony': 56,
    'Microsoft': 32,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF9FAFB), // Off-white background
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.close, color: Color(0xFF0F172A)),
                  onPressed: () => Navigator.pop(context),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 36,
                    minHeight: 36,
                  ),
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'Filter & Sort',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _selectedSort = 'Newest First';
                      _priceRange = const RangeValues(50, 1200);
                      _selectedBrands.updateAll((key, value) => false);
                    });
                  },
                  child: const Text(
                    'Reset All',
                    style: TextStyle(
                      color: Color(0xFFF48221),
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: Color(0xFFE2E8F0), height: 1),

          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sort By Section
                  _buildSectionTitle(Icons.sort, 'Sort by'),
                  const SizedBox(height: 16),
                  ..._sortOptions.map((option) => _buildSortOption(option)),
                  const SizedBox(height: 28),

                  // Price Range Section
                  _buildSectionTitle(
                    Icons.payments_outlined,
                    'Price Range',
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF7ED),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        '\$${_priceRange.start.toInt()} - \$${_priceRange.end.toInt()}',
                        style: const TextStyle(
                          color: Color(0xFFF48221),
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SliderTheme(
                    data: SliderThemeData(
                      activeTrackColor: const Color(0xFFF48221),
                      inactiveTrackColor: const Color(0xFFFED7AA),
                      thumbColor: Colors.white,
                      overlayColor: const Color(
                        0xFFF48221,
                      ).withOpacity(0.2),
                      trackHeight: 4,
                      rangeThumbShape: const RoundRangeSliderThumbShape(
                        enabledThumbRadius: 10,
                        elevation: 4,
                      ),
                    ),
                    child: RangeSlider(
                      values: _priceRange,
                      min: 0,
                      max: 2000,
                      divisions: 40,
                      onChanged: (RangeValues values) {
                        setState(() {
                          _priceRange = values;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildPriceInput(
                        'MIN',
                        '\$ ${_priceRange.start.toInt()}',
                      ),
                      _buildPriceInput('MAX', '\$ ${_priceRange.end.toInt()}'),
                    ],
                  ),
                  const SizedBox(height: 28),

                  // Brands Section
                  _buildSectionTitle(
                    Icons.branding_watermark_outlined,
                    'Brands',
                  ),
                  const SizedBox(height: 16),
                  ..._selectedBrands.keys.map(
                    (brand) => _buildBrandCheckbox(brand),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Text(
                        'Show more brands',
                        style: TextStyle(
                          color: Color(0xFFF48221),
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: Color(0xFFF48221),
                        size: 16,
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),

                  // Customer Ratings Section
                  _buildSectionTitle(Icons.star_outline, 'Customer Ratings'),
                  const SizedBox(height: 16),
                  // Assuming ratings would go here, maybe 5 stars selection
                  // Left blank to match the provided layout
                ],
              ),
            ),
          ),

          // Fixed Bottom Buttons
          Container(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, -4),
                  blurRadius: 16,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _selectedSort = 'Newest First';
                        _priceRange = const RangeValues(50, 1200);
                        _selectedBrands.updateAll((key, value) => false);
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFFF48221),
                      side: const BorderSide(
                        color: Color(0xFFF48221),
                        width: 1.5,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Clear',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF48221),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Apply Filters',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(IconData icon, String title, {Widget? trailing}) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFFF48221), size: 20),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 15,
            color: Color(0xFF0F172A),
          ),
        ),
        if (trailing != null) ...[const Spacer(), trailing],
      ],
    );
  }

  Widget _buildSortOption(String label) {
    bool isSelected = _selectedSort == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSort = label;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFFF48221) : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                fontSize: 14,
                color: const Color(0xFF334155),
              ),
            ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFFF48221)
                      : const Color(0xFFE2E8F0),
                  width: isSelected ? 6 : 1.5,
                ),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceInput(String label, String value) {
    return Column(
      crossAxisAlignment: label == 'MIN'
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            color: Color(0xFF64748B),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          width: 90,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            value,
            textAlign: label == 'MIN' ? TextAlign.left : TextAlign.right,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
              color: Color(0xFF334155),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBrandCheckbox(String brand) {
    bool isSelected = _selectedBrands[brand] ?? false;
    int count = _brandCounts[brand] ?? 0;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedBrands[brand] = !isSelected;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFFF48221)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFFF48221)
                      : const Color(0xFFE2E8F0),
                  width: 1.5,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check, color: Colors.white, size: 14)
                  : null,
            ),
            const SizedBox(width: 12),
            Text(
              brand,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color(0xFF334155),
              ),
            ),
            const Spacer(),
            Text(
              count.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Color(0xFF94A3B8), // Same light gray-blue color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
