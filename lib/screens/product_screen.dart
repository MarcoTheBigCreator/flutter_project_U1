import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.network(
              'https://via.placeholder.com/350x150',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Product Name',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 16),
          Text(
            'Product Description',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Color 1'),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Color 2'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
