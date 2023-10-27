import 'package:flutter/material.dart';
import 'package:flutter_application_u1/screens/product2_screen.dart';
import 'package:flutter_application_u1/services/products_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_u1/screens/home_screen.dart';
import 'package:flutter_application_u1/screens/product_screen.dart';
import 'package:flutter_application_u1/screens/catalog_screen.dart';
import 'package:flutter_application_u1/services/service.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ProductsService())],
      child: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Eccomerce",
      initialRoute: "main",
      routes: {
        "main": (_) => const HomeScreen(),
        "catalog": (_) => const ProductScreen(),
        "product": (_) => const SingleProduct()
      },
    );
  }
}
