import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_u1/models/product.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {
  final String _baseUrl = 'flutteapp-b8809-default-rtdb.firebaseio.com';
  final List<Product> products = [];

  bool isLoading = true;

  ProductsService() {
    loadProducts();
  }

  Future<List<Product>> loadProducts() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'products.json');

    final resp = await http.get(url);

    final Map<String, dynamic> productMap = json.decode(resp.body);

    productMap.forEach((key, value) {
      final product = Product.fromMap(value);
      products.add(product);
    });

    isLoading = false;
    notifyListeners();

    return products;
  }
}
