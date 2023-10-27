import 'package:flutter/material.dart';
import 'package:flutter_application_u1/widgets/circlewidget.dart';
import 'package:flutter_application_u1/widgets/button.dart';

class SingleProduct extends StatelessWidget {
  const SingleProduct({Key? key}) : super(key: key);

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
              'FW19',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {},
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
          buildFullscreenContainer(context),
          sneakersRows(),
          blackButton(), // Add the black button
        ],
      ),
    );
  }

  Image fullscreenImage() {
    return Image.network(
      'https://media.gq.com.mx/photos/616f066ac11890a7831a695d/1:1/w_1688,h_1688,c_limit/nike%20dia%20de%20muertos.jpg',
      fit: BoxFit.cover,
    );
  }

  Container buildFullscreenContainer(BuildContext context) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      color: Colors.blue,
      child: fullscreenImage(),
    );
  }

  Widget sizes() {
    return SizedBox(
      width: 50,
      child: Column(
        children: [
          // First vertical section with ListWheelScrollView
          Expanded(
            child: ListWheelScrollView(
              itemExtent: 60, // Adjust this value as needed
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
          // Second vertical section
          Expanded(
            flex: 0, // Adjust the flex value to make it larger
            child: Container(
                // Add your content for the second section here
                ),
          ),
        ],
      ),
    );
  }

  Expanded description() {
    return const Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
          SizedBox(
              height: 20), // Add space between the color section and size text
          Padding(
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
                padding: EdgeInsets.all(20.0), // Add padding to the text
                child: SingleChildScrollView(
                  child: Text(
                    '''Introducing the epitome of style and comfort in the world of footwear – our cutting-edge sneakers. Crafted with precision and innovation, our sneakers are a fusion of form and function, designed to elevate your everyday footwear experience.Immerse yourself in the ultimate combination of fashion-forward design and superior functionality. These sneakers are more than just shoes; they are a statement of individuality and a testament to modern craftsmanship. With their sleek and versatile silhouette, they seamlessly blend with any outfit, whether you're strolling through the city streets or hitting the gym for an intense workout.These sneakers boast a cushioned insole that pampers your feet with every step, ensuring all-day comfort and support. The durable outsole provides exceptional traction and stability, making them your ideal companion for any adventure. The breathable upper material allows for optimal airflow, keeping your feet cool and dry even during the most demanding activities.Elevate your footwear game with our sneakers – a true embodiment of style, comfort, and quality. Whether you're a trendsetter on the streets or an athlete in pursuit of excellence, these sneakers are the perfect choice to complement your unique lifestyle. Step into a world of unmatched performance and style, and experience the future of footwear.
                    ''',
                    style: TextStyle(
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
      ),
    );
  }

  Widget sneakersRows() {
    return Expanded(
      child: Row(
        children: [
          sizes(),
          description(),
        ],
      ),
    );
  }
}
