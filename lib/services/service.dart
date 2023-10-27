import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_u1/models/shoes.dart';
import 'package:flutter_application_u1/models/upperbody.dart';
import 'package:http/http.dart' as http;

class ShoesService extends ChangeNotifier {
  final String _baseUrl = 'flutterhomework-8dfc2-default-rtdb.firebaseio.com';
  final List allData = [];

  bool isLoading = true;

  ShoesService() {
    this.loadShoes();
  }

  Future<List> loadShoes() async {
    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'shoes.json');
    final url2 = Uri.https(_baseUrl, 'upperbody.json');
    final resp = await http.get(url);
    final resp2 = await http.get(url2);

    final Map<String, dynamic> shoesMap = json.decode(resp.body);
    final Map<String, dynamic> upperbodyMap = json.decode(resp2.body);

    shoesMap.forEach((key, value) {
      final shu = Shoe.fromMap(value);
      this.allData.add(shu);
    });

    upperbodyMap.forEach((key, value) {
      final upper = Upperbody.fromMap(value);
      this.allData.add(upper);
    });
    this.isLoading = false;
    notifyListeners();

    return allData;
  }
}
