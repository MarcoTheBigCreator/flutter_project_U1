import 'package:flutter/material.dart';
import 'package:flutter_application_u1/screens/catalog_screen.dart';
import 'package:flutter_application_u1/services/product_service.dart';
import 'package:flutter_application_u1/services/products_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_u1/screens/home_screen.dart';
import 'package:flutter_application_u1/screens/product_screen.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductsService>(
          create: (_) => ProductsService(),
        ),
        ChangeNotifierProvider<ProductService>(
          create: (_) => ProductService(),
        ),
      ],
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
        "catalog": (_) => const CatalogScreen(),
        "product": (_) => const Product()
      },
    );
  }
}
