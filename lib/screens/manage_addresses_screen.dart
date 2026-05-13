import 'package:flutter/material.dart';

class ManageAddressesScreen extends StatefulWidget {
  const ManageAddressesScreen({super.key});

  @override
  State<ManageAddressesScreen> createState() => _ManageAddressesScreenState();
}

class _ManageAddressesScreenState extends State<ManageAddressesScreen> {
  int _selectedAddressIndex = 0;

  final List<Map<String, dynamic>> _addresses = [
    {
      'type': 'Home',
      'name': 'Aditya Narayan',
      'phone': '+1 (555) 123-4567',
      'address': '123 Main Street, Apt 4B\nNew York, NY 10001\nUnited States',
      'isDefault': true,
    },
    {
      'type': 'Work',
      'name': 'Dubey Ji',
      'phone': '+1 (555) 987-6543',
      'address': '456 Business Blvd, Suite 200\nSan Francisco, CA 94107\nUnited States',
      'isDefault': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF0F172A)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Shipping Addresses',
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(24),
        itemCount: _addresses.length + 1, // +1 for the 'Add New' button
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          if (index == _addresses.length) {
            return _buildAddNewAddressBtn();
          }
          return _buildAddressCard(index);
        },
      ),
    );
  }

  Widget _buildAddressCard(int index) {
    final address = _addresses[index];
    final isSelected = _selectedAddressIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedAddressIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFFF48221) : const Color(0xFFF1F5F9),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: const Color(0xFFF48221).withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              )
            else
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      address['type'] == 'Home' ? Icons.home_rounded : Icons.work_rounded,
                      color: isSelected ? const Color(0xFFF48221) : const Color(0xFF64748B),
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      address['type'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    if (address['isDefault']) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF7ED),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'Default',
                          style: TextStyle(
                            color: Color(0xFFF48221),
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                Icon(
                  isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                  color: isSelected ? const Color(0xFFF48221) : const Color(0xFFCBD5E1),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(color: Color(0xFFF1F5F9), height: 1),
            const SizedBox(height: 16),
            Text(
              address['name'],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              address['phone'],
              style: const TextStyle(
                color: Color(0xFF64748B),
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              address['address'],
              style: const TextStyle(
                color: Color(0xFF475569),
                fontSize: 13,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Edit Address feature coming soon!')),
                    );
                  },
                  icon: const Icon(Icons.edit_outlined, size: 16, color: Color(0xFF64748B)),
                  label: const Text('Edit', style: TextStyle(color: Color(0xFF64748B))),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(50, 30),
                    alignment: Alignment.centerLeft,
                  ),
                ),
                if (!address['isDefault'])
                  TextButton.icon(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Delete Address'),
                          content: const Text('Are you sure you want to delete this address?'),
                          actions: [
                            TextButton(onPressed: () => Navigator.pop(context), child: const Text('CANCEL')),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _addresses.removeAt(index);
                                  // Update selected index if necessary
                                  if (_selectedAddressIndex >= _addresses.length) {
                                    _selectedAddressIndex = _addresses.isNotEmpty ? _addresses.length - 1 : 0;
                                  } else if (_selectedAddressIndex > index) {
                                    _selectedAddressIndex--;
                                  }
                                });
                                Navigator.pop(context);
                              },
                              child: const Text('DELETE', style: TextStyle(color: Colors.red)),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(Icons.delete_outline, size: 16, color: Color(0xFFEF4444)),
                    label: const Text('Delete', style: TextStyle(color: Color(0xFFEF4444))),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(50, 30),
                      alignment: Alignment.centerLeft,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddNewAddressBtn() {
    return InkWell(
      onTap: () {
        // Show add new address form
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFF48221).withOpacity(0.5), style: BorderStyle.none),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFF48221).withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.add_circle_outline, color: Color(0xFFF48221)),
            SizedBox(width: 8),
            Text(
              'Add New Address',
              style: TextStyle(
                color: Color(0xFFF48221),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
