import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'H O M E',
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
              Navigator.pushNamed(context, "catalog");
            },
            icon: const Icon(Icons.menu),
            color: Colors.black,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              color: Colors.black,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/image1.jpg'),
                const SizedBox(height: 20),
                Image.asset('assets/image2.jpg'),
                const SizedBox(height: 20),
                Image.asset('assets/image3.jpg'),
                const SizedBox(height: 20)
              ]),
        ));
  }
}
