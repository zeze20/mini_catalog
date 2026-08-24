import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../services/api_service.dart';
import '../components/product_card_tile.dart';
import 'cart_screen.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();
  List<Data> _allProducts = [];
  final Set<int> _cartIds = {};
  bool _isLoading = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });
    try {
      final productModel = await _apiService.fetchProducts();
      setState(() {
        _allProducts = productModel.data ?? [];
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Ürünler yüklenirken bir hata oluştu.';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Discover',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Stack(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.shopping_bag_outlined, size: 28),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CartScreen(
                                products: _allProducts,
                                cartIds: _cartIds,
                              ),
                            ),
                          ).then((_) => setState(() {}));
                        },
                      ),
                      if (_cartIds.isNotEmpty)
                        Positioned(
                          right: 6,
                          top: 6,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              '${_cartIds.length}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              const Text(
                'Find your perfect device',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 14),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search products...',
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://wantapi.com/assets/banner.png',
                  height: 80,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 80,
                    color: Colors.blueGrey.shade100,
                    child: const Center(
                      child: Text(
                        'GIFT STORE BANNER',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : _errorMessage.isNotEmpty
                        ? Center(
                            child: Text(
                              _errorMessage,
                              style: const TextStyle(color: Colors.red),
                            ),
                          )
                        : GridView.builder(
                            itemCount: _allProducts.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 0.7,
                            ),
                            itemBuilder: (context, index) {
                              final product = _allProducts[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductDetailScreen(
                                        product: product,
                                        cartIds: _cartIds,
                                      ),
                                    ),
                                  ).then((_) => setState(() {}));
                                },
                                child: ProductCardTile(product: product),
                              );
                            },
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
