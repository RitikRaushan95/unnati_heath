import 'package:WeCare/Welcome.dart';
import 'package:WeCare/mybot.dart';
import 'package:WeCare/recommendations.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Shop());
}

class Shop extends StatefulWidget {
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  int cartItemCount = 0;
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => WelcomeUser()));
        break;
      case 1:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Recomend()));
        break;
      case 2:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Shop()));
        break;
      case 3:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => chatbot()));
        break;
      case 4:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => DocScreen()));
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CustomAppBar(cartItemCount: cartItemCount),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 5),
              Center(
                child: Text(
                  "Order Medicines Now",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BigContainer(
                    text: 'Abacavir',
                    imagePath: 'assets/single_medicine.png',
                    onAddToCart: () {
                      setState(() {
                        cartItemCount++;
                      });
                    },
                  ),
                  BigContainer(
                    text: 'Amoxicillin',
                    imagePath: 'assets/single_medicine.png',
                    onAddToCart: () {
                      setState(() {
                        cartItemCount++;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BigContainer(
                    text: 'Benedryl',
                    imagePath: 'assets/syrup.png',
                    onAddToCart: () {
                      setState(() {
                        cartItemCount++;
                      });
                    },
                  ),
                  BigContainer(
                    text: 'Paracetamole',
                    imagePath: 'assets/Medicinebg.png',
                    onAddToCart: () {
                      setState(() {
                        cartItemCount++;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BigContainer(
                    text: 'Digene Tablets',
                    imagePath: 'assets/Medicinebg.png',
                    onAddToCart: () {
                      setState(() {
                        cartItemCount++;
                      });
                    },
                  ),
                  BigContainer(
                    text: 'Vicks',
                    imagePath: 'assets/vicks.png',
                    onAddToCart: () {
                      setState(() {
                        cartItemCount++;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromARGB(255, 112, 238, 119),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital),
              label: 'Doctor',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Ask',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.description),
              label: 'Doc',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int cartItemCount;

  CustomAppBar({required this.cartItemCount});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WelcomeUser(),
            ),
          );
        },
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Medicine',
            style: TextStyle(fontSize: 18),
          ),
          Row(
            children: <Widget>[
              Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      // Add your cart button functionality here
                    },
                  ),
                  Positioned(
                    right: 0,
                    child: cartItemCount > 0
                        ? CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.red,
                            child: Text(
                              cartItemCount.toString(),
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : SizedBox(),
                  ),
                ],
              ),
              SizedBox(width: 10), // Add space between icons
              IconButton(
                icon: Icon(Icons.filter_list),
                onPressed: () {
                  // Add your filter button functionality here
                },
              ),
            ],
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(10.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.black),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(
                          10.0), // Add padding inside the TextField
                      border: InputBorder.none, // Hide default border
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + 60.0); // Adjust the height of the AppBar
}

class BigContainer extends StatelessWidget {
  final String text;
  final String imagePath;
  final VoidCallback? onAddToCart;

  BigContainer({required this.text, required this.imagePath, this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      padding: EdgeInsets.all(10.0), // Decrease padding
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold), // Decrease font size
          ),
          SizedBox(height: 5), // Adjusted height
          Image.asset(
            imagePath,
            height: 50,
            width: 50,
          ),
          SizedBox(height: 5), // Adjusted height
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$ 4.0',
                  style: TextStyle(fontSize: 10)), // Decrease font size
              GestureDetector(
                onTap: onAddToCart,
                child: Container(
                  padding: EdgeInsets.all(5.0), // Decrease padding
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Icon(Icons.add,
                      color: Colors.green, size: 20), // Adjusted size
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}

class DoctorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor'),
      ),
      body: Center(
        child: Text('Doctor Screen'),
      ),
    );
  }
}

class ShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
      ),
      body: Center(
        child: Text('Shop Screen'),
      ),
    );
  }
}

class AskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ask'),
      ),
      body: Center(
        child: Text('Ask Screen'),
      ),
    );
  }
}

class DocScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doc'),
      ),
      body: Center(
        child: Text('Doc Screen'),
      ),
    );
  }
}
