import 'package:flutter/material.dart';

class CartInfoBox extends StatelessWidget {
  const CartInfoBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, color: Colors.grey.shade600, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Free shipping on all standard orders. Items in cart are reserved for a limited time during session.',
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
