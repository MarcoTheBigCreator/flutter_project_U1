import 'package:flutter/material.dart';

import 'package:flutter_application_u1/services/products_service.dart';
import 'package:flutter_application_u1/screens/loading_screen.dart';
import 'package:flutter_application_u1/widgets/product_card.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductsService>(context);

    if (productsService.isLoading) {
      return const LoadingScreen();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'C A T A L O G',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "main");
          },
          icon: const Icon(Icons.menu),
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "product");
            },
            icon: const Icon(Icons.square),
            color: Colors.black,
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, index) => GestureDetector(
          child: ProductCard(
            product: productsService.products[index],
          ),
          onTap: () => {},
        ),
        itemCount: productsService.products.length,
      ),
    );
  }
}
