import 'package:flutter/material.dart';
import 'package:flutter_application_u1/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1, // Use a 1:1 aspect ratio for the image container
            child: _BackgroundImage(product.pic),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Center(
                  // Centra los textos verticalmente
                  child: Text(
                    product.name,
                    style: const TextStyle(
                        fontFamily: 'Impact',
                        fontSize: 19,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Center(
                  // Centra los textos verticalmente
                  child: Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  final String? url;

  const _BackgroundImage(this.url);

  @override
  Widget build(BuildContext context) {
    return url == null
        ? Image.asset('assets/image.png', fit: BoxFit.cover)
        : Image.network(
            url!,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          );
  }
}
