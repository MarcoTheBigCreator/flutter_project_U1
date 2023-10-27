import 'package:flutter/material.dart';
import 'package:flutter_application_u1/services/products_service.dart';
import 'package:flutter_application_u1/screens/loading_screen.dart';
import 'package:flutter_application_u1/widgets/product_card.dart';
import 'package:provider/provider.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

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
                fontStyle: FontStyle.italic,
              ),
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
            icon: const Icon(Icons.shopping_bag_outlined),
            color: Colors.black,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Dos columnas
          mainAxisSpacing: 16.0, // Espacio vertical entre tarjetas
          crossAxisSpacing: 16.0, // Espacio horizontal entre tarjetas
          childAspectRatio: 0.7, // Ajusta según tus necesidades
        ),
        padding: const EdgeInsets.all(
            16.0), // Agrega márgenes alrededor de las tarjetas
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
