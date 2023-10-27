import 'package:flutter/material.dart';
import 'package:flutter_application_u1/widgets/circlewidget.dart';
import 'package:flutter_application_u1/widgets/button.dart';
import 'package:flutter_application_u1/services/product_service.dart';
import 'package:flutter_application_u1/screens/loading_screen.dart';
import 'package:provider/provider.dart';

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);

    if (productService.isLoading) {
      return const LoadingScreen();
    }

    final product =
        productService.data.isNotEmpty ? productService.data.first : null;

    if (product == null) {
      return const Center(child: Text('No products found.'));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'PRODUCT',
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
            Navigator.pushNamed(context, "catalog");
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_sharp),
            color: Colors.black,
          ),
        ],
      ),
      body: Column(
        children: [
          buildFullscreenContainer(context, product.pic),
          sneakersRows(product.description),
          blackButton(),
        ],
      ),
    );
  }

  Image fullscreenImage(String imageUrl) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
    );
  }

  Container buildFullscreenContainer(BuildContext context, String imageUrl) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      color: Colors.blue,
      child: fullscreenImage(imageUrl),
    );
  }
}

Expanded description(String productDescription) {
  return Expanded(
      child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Row(
        children: [
          Padding(
            padding: EdgeInsets.all(1.0),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Color:",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'fightt3_',
                    ),
                  ),
                ),
                CircleWidget(Colors.black),
                CircleWidget(Colors.deepPurple),
                CircleWidget(Colors.green),
              ],
            ),
          ),
        ],
      ),
      const SizedBox(height: 20),
      const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Text(
          "Description",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'fightt3_',
          ),
        ),
      ),
      Expanded(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Text(
                productDescription,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  height: 2.0,
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  ));
}

Widget sizes() {
  return SizedBox(
      width: 50,
      child: Column(
        children: [
          Expanded(
            child: ListWheelScrollView(
              itemExtent: 60,
              useMagnifier: true,
              magnification: 1,
              children: List<Widget>.generate(30, (index) {
                return Center(
                  child: Text(
                    ('Size: $index'),
                    style: const TextStyle(fontSize: 16),
                  ),
                );
              }),
            ),
          ),
          Expanded(
            flex: 0,
            child: Container(),
          ),
        ],
      ));
}

Widget sneakersRows(String productDescription) {
  return Expanded(
      child: Row(
    children: [
      sizes(),
      description(productDescription),
    ],
  ));
}
