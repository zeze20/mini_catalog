import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../components/mini_card_tile.dart';
import '../components/cart_empty_box.dart';
import '../components/cart_info_box.dart';

class CartScreen extends StatefulWidget {
  final List<Data> products;
  final Set<int> cartIds;

  const CartScreen({
    Key? key,
    required this.products,
    required this.cartIds,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProducts = widget.products.where((p) => widget.cartIds.contains(p.id)).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Cart', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: cartProducts.isEmpty
                    ? const CartEmptyBox()
                    : ListView.builder(
                        itemCount: cartProducts.length,
                        itemBuilder: (context, index) {
                          final item = cartProducts[index];
                          return MiniCardTile(
                            name: item.name ?? '',
                            tagline: item.tagline ?? '',
                            price: item.price ?? '',
                            imageUrl: item.image ?? '',
                            onRemove: () {
                              setState(() {
                                widget.cartIds.remove(item.id);
                              });
                            },
                          );
                        },
                      ),
              ),
              const SizedBox(height: 8),
              const CartInfoBox(),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: cartProducts.isEmpty
                    ? null
                    : () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Proceeding to Checkout...')),
                        );
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Colors.grey.shade300,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Checkout', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
