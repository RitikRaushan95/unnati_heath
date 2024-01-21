import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:WeCare/loginui.dart';

void main() {
  runApp(const Start());
}

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _MyAppState();
}

class _MyAppState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GetStarted(),
    );
  }
}

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  int _currentPage = 0;

  List<String> healthcareImages = [
    'assets/healthcare_image1.png',
    'assets/healthcare_image2.png',
    'assets/healthcare_image3.png',
  ];

  List<String> imageDescriptions = [
    'Take suggestions of expert from your home',
    'Book your own appointment',
    'Telemedicine service',
  ];

  List<String> titles = [
    'Home Care',
    'Appointment',
    'Video Assistant',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        flexibleSpace: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 450.0,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPage = index;
                });
              },
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
            ),
            items: healthcareImages.map((imageUrl) {
              return CarouselItem(imageUrl: imageUrl);
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              healthcareImages.length,
              (index) => buildDot(index),
            ),
          ),
          ListTile(
            title: Center(
              child: Text(
                titles[_currentPage],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            subtitle: Center(
              child: Text(imageDescriptions[_currentPage]),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginUi(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(67, 177, 75, 1.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: const Text(
              "Get Started",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentPage == index
              ? const Color.fromARGB(255, 112, 238, 119)
              : Colors.grey,
        ),
      ),
    );
  }
}

class CarouselItem extends StatelessWidget {
  final String imageUrl;

  const CarouselItem({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 16.0,
            height: 300.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: imageUrl.startsWith('http')
                  ? Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        );
      },
    );
  }
}
