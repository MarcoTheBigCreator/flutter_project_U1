import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_u1/services/service.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shoesService = Provider.of<ShoesService>(context);

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
    );
  }
}

class CustomCard extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final allData;

  const CustomCard({Key? key, required this.allData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: AspectRatio(
              aspectRatio: 1, // Use a 1:1 aspect ratio for the image container
              child: Image.network(
                allData.pic,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  allData.name,
                  style: const TextStyle(fontFamily: 'Impact'),
                ),
                Text(
                  allData.price,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Impact',
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
