import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductService {
  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonResult = json.decode(response.body);
      return jsonResult.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load products (status: \\${response.statusCode})');
    }
  }
} 