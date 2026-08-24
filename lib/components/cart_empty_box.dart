import 'package:flutter/material.dart';

class CartEmptyBox extends StatelessWidget {
  const CartEmptyBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.shopping_bag_outlined, size: 72, color: Colors.grey),
          const SizedBox(height: 16),
          const Text(
            'Your cart is empty',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Add items to start shopping',
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }
}
