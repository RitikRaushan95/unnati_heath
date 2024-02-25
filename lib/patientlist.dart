import 'package:WeCare/hospital.dart';
import 'package:WeCare/loginui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DocPro());
}

class DocPro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          backgroundColor: Colors.green,
          leading: IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginUi()),
              );
            },
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Container(
            height: 70,
            color: Colors.green,
          ),
          Positioned(
            top: 10.0,
            left: 20.0,
            child: Container(
              width: 200.0,
              height: 200.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 5.0,
                ),
              ),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    'assets/profile_image1.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 20.0,
            left: screenWidth * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dr Asha Kashyap',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      'Dermatologist\n',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.green,
                    ),
                    Text(
                      'Danapur, Patna, Bihar',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 220.0,
            left: screenWidth * 0.1,
            child: Text(
              'Patients List',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Positioned(
            top: 220.0,
            right: screenWidth * 0.1,
            child: Row(
              children: [
                Text(
                  'See All',
                  style: TextStyle(fontSize: 16.0),
                ),
                Icon(
                  Icons.arrow_forward,
                  size: 16.0,
                ),
              ],
            ),
          ),
          Positioned(
            top: 280.0,
            left: screenWidth * 0.1,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          'assets/Anuj.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Row(
                      children: [
                        Text('Richa Awasthi'),
                        SizedBox(width: 85),
                        Icon(Icons.arrow_upward),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          'assets/Ritu.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Row(
                      children: [
                        Text('Manvi Goyal'),
                        SizedBox(width: 100),
                        Icon(Icons.arrow_upward),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          'assets/Manvi.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Text('Rachna Singh'),
                        SizedBox(width: 100),
                        Icon(Icons.arrow_upward),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          'assets/Pramod.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Text('Pramod Singh'),
                        SizedBox(width: 100),
                        Icon(Icons.arrow_upward),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Patients',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.show_chart,
            ),
            label: 'Hospiotal Report',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DocPro()),
        );
      } else if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HosReport(),
          ),
        );
      }
    });
  }
}

class PatientsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patients'),
      ),
      body: Center(
        child: Text('Patients Screen Content'),
      ),
    );
  }
}

class AppointmentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments'),
      ),
      body: Center(
        child: Text('Appointments Screen Content'),
      ),
    );
  }
}
