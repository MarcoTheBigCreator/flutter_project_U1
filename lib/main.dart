import 'package:flutter/material.dart';
import 'package:flutter_application_u1/screens/catalog_screen.dart';
import 'package:flutter_application_u1/screens/product_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clothing Store',
      home: SingleProduct(),
      // routes: {
      //   "catalog" : (_) => const CatalogScreen(),
      //   "product" : (_) => const ProductScreen(),
      // },
    );
  }
}
