import 'package:flutter/material.dart';

void main() {
  runApp(recomend());
}

class recomend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color.fromRGBO(67, 177, 75, 1.0)),
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0, // Remove shadow
          title: Padding(
            padding: EdgeInsets.only(top: 20), // Add vertical space at the top
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 16), // Adding space at the beginning
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors
                        .grey, // you can change the background color of the circle here
                  ),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage("assets/profile_image.png"),
                    radius: 20,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome',
                      style: TextStyle(fontSize: 20),
                    ),
                    const Text(
                      'Aastha',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: const [
                    Text(
                      'Patna, Bihar',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.location_on, size: 30),
                    SizedBox(width: 16), // Adding space at the end
                  ],
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize:
                Size.fromHeight(60), // Set the height of the bottom widget
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8), // Adjust horizontal padding to decrease width
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 12), // Adjust horizontal padding here
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search doctor',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: const Center(
          child: Text("Body Content"),
        ),
      ),
    );
  }
}
