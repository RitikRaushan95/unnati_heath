import 'package:WeCare/Welcome.dart';
import 'package:WeCare/medicine.dart';
import 'package:WeCare/mybot.dart';
import 'package:WeCare/recommendations.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Document());
}

class Document extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Doc(),
    );
  }
}

class Doc extends StatefulWidget {
  @override
  _DocState createState() => _DocState();
}

class _DocState extends State<Doc> {
  int cartItemCount = 0;
  int _selectedIndex = 4;

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
            context, MaterialPageRoute(builder: (context) => Doc()));
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Documents and Certificates"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Certificates and Reports",
              style: TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          _buildCertificateRow(
              Icons.favorite, "ECG Report", "            Download"),
          _buildCertificateRow(
              Icons.bug_report, "Covid 19 Report", "    Download"),
          _buildCertificateRow(
              Icons.scatter_plot, "Stress Test Report", "Download"),
          // Add more rows as needed with different text formats

          // Add the new container with the border and "+" icon
          SizedBox(height: 200.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(
                child: Icon(
                  Icons.add,
                  size: 50.0,
                  color: Colors.black,
                ),
              ),
              width: double.infinity,
              height: 100.0,
            ),
          ),
        ],
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
            label: 'Doc',
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
    );
  }

  Widget _buildCertificateRow(
      IconData? icon, String? subtitle, String? action) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 30.0),
          if (icon != null) Icon(icon, size: 30.0, color: Colors.black),
          SizedBox(width: 30.0),
          if (subtitle != null)
            Text(subtitle, style: TextStyle(fontSize: 18.0)),
          SizedBox(width: 30.0),
          if (action != null)
            Text(action, style: TextStyle(fontSize: 18.0, color: Colors.green)),
          //SizedBox(width: 50.0),
        ],
      ),
    );
  }
}
