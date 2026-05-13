import 'package:flutter/material.dart';

class MockData {
  static final List<Map<String, dynamic>> cartItems = [
    {
      'id': '1',
      'name': 'MacBook Pro 14"',
      'variant': 'Space Grey | 16GB | 512GB',
      'price': 1999.00,
      'quantity': 1,
      'image': Icons.laptop_mac,
    },
    {
      'id': '2',
      'name': 'Sony WH-1000XM5',
      'variant': 'Midnight Blue',
      'price': 349.99,
      'quantity': 1,
      'image': Icons.headphones,
    },
    {
      'id': '3',
      'name': 'Logitech MX Master 3S',
      'variant': 'Graphite',
      'price': 99.00,
      'quantity': 2,
      'image': Icons.mouse,
    },
  ];

  static double get subtotal {
    return cartItems.fold(0.0, (sum, item) => sum + ((item['price'] as num).toDouble() * (item['quantity'] as num).toInt()));
  }

  static double get shipping => subtotal > 500 ? 0.0 : 15.0; // Free shipping over $500
  static double get taxes => subtotal * 0.05;
  static double get total => subtotal + taxes + shipping;

  static const Map<String, dynamic> shippingAddress = {
    'type': 'Home',
    'title': 'Aditya\'s Residence',
    'address': '123 Maple Street, Apt 4B, Springfield, IL 62704',
    'phone': '+1 555 123 4567',
  };

  static const Map<String, dynamic> paymentMethod = {
    'type': 'VISA',
    'cardHolder': 'Aditya Narayan',
    'cardNumber': '**** **** **** 4242',
    'expiry': '12/26',
  };
}
