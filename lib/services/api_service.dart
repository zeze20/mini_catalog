import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ApiService {
  static const String _baseUrl = 'https://wantapi.com/products.php';

  Future<ProductModel> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body) as Map<String, dynamic>;
        return ProductModel.fromJson(decodedData);
      } else {
        throw Exception('Failed to load products. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network / Parsing Error: $e');
    }
  }
}
