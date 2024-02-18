import 'dart:async';
import 'dart:math';

import 'package:WeCare/patientlist.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(HosReport());
}

class HosReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 1;
  List<int> histogramData = List.filled(3, 0);

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        histogramData = List.generate(3, (index) => Random().nextInt(500));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(20.0),
        child: AppBar(
          backgroundColor: Colors.green,
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Container(
            height: 86.0,
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
                    'assets/buehearthospital.png',
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
                  'Curis Hospital',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        launch('https://maps.app.goo.gl/f7Ln4eWt3H9dizkH7');
                      },
                      child: Icon(
                        Icons.location_on,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Danapur, Patna, Bihar',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.account_balance_wallet,
                      color: Colors.green,
                    ),
                    Text(
                      '2000\$',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 220.0,
            left: screenWidth * 0.02,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 15,
                      height: 15,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      'Appointments',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Container(
                      width: 15,
                      height: 15,
                      color: Colors.indigo[900], // Choose the color you want
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      'Patients',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Container(
                      width: 15,
                      height: 15,
                      color: Colors.orange[700], // Choose the color you want
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      'Operations',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: List.generate(
                    histogramData.length,
                    (index) => SizedBox(
                      width: 50.0,
                      child: Text(
                        '${histogramData[index]}',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  height: 200.0,
                  width: screenWidth * 0.7,
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.center,
                      maxY: 500,
                      groupsSpace: 50.0,
                      barTouchData: BarTouchData(
                        touchTooltipData: BarTouchTooltipData(
                          tooltipBgColor: Colors.blueAccent,
                        ),
                      ),
                      titlesData: FlTitlesData(
                        leftTitles: SideTitles(
                          showTitles: true,
                          interval: 100,
                        ),
                        bottomTitles: SideTitles(
                          showTitles: true,
                          interval: 1,
                        ),
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(color: Colors.black),
                      ),
                      barGroups: [
                        BarChartGroupData(
                          x: 0,
                          barRods: [
                            BarChartRodData(
                              y: histogramData[0].toDouble(),
                              colors: [Colors.blueAccent],
                              width: 30.0,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(6),
                                topLeft: Radius.circular(6),
                              ),
                            ),
                          ],
                        ),
                        BarChartGroupData(
                          x: 1,
                          barRods: [
                            BarChartRodData(
                              y: histogramData[1].toDouble(),
                              colors: [Colors.indigo],
                              width: 30.0,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(6),
                                topLeft: Radius.circular(6),
                              ),
                            ),
                          ],
                        ),
                        BarChartGroupData(
                          x: 2,
                          barRods: [
                            BarChartRodData(
                              y: histogramData[2].toDouble(),
                              colors: [Colors.orange],
                              width: 30.0,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(6),
                                topLeft: Radius.circular(6),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
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
            label: 'Hospital Report',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        // Replace DocPro with the appropriate class for the Patients screen
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
