import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_u1/models/product.dart';
import 'package:http/http.dart' as http;

class ProductService extends ChangeNotifier {
  final String _baseUrl = 'flutteapp-b8809-default-rtdb.firebaseio.com';
  final List<ProductScreen> data = [];

  bool isLoading = true;

  ProductService() {
    loadData();
  }

  Future<List<ProductScreen>> loadData() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'data.json');

    final resp = await http.get(url);

    final Map<String, dynamic> productMap = json.decode(resp.body);

    productMap.forEach((key, value) {
      final item = ProductScreen.fromMap(value);
      data.add(item);
    });

    isLoading = false;
    notifyListeners();

    return data;
  }
}
