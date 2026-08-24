import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductDetailScreen extends StatefulWidget {
  final Data product;
  final Set<int> cartIds;

  const ProductDetailScreen({
    Key? key,
    required this.product,
    required this.cartIds,
  }) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Details', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: product.id ?? 0,
                child: Image.network(
                  product.image ?? '',
                  height: 320,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 320,
                    color: Colors.grey.shade200,
                    child: const Icon(Icons.broken_image, size: 64, color: Colors.grey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name ?? '',
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product.tagline ?? '',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Description',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      product.description ?? 'No description available for this product.',
                      style: const TextStyle(fontSize: 13, height: 1.4, color: Colors.black87),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      product.price ?? '',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade800,
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          widget.cartIds.add(product.id ?? 0);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Added to Cart!'),
                            duration: const Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.green.shade700,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('Buy Now', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
