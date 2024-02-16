import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(LineGraph());
}

class LineGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LineChartSample(),
    );
  }
}

class LineChartSample extends StatefulWidget {
  @override
  _LineChartSampleState createState() => _LineChartSampleState();
}

class _LineChartSampleState extends State<LineChartSample> {
  List<FlSpot> spots = [];
  int counter = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    spots = _createSpots();
    timer = Timer.periodic(Duration(seconds: 2), (Timer t) {
      setState(() {
        spots = _createSpots();
        counter++;
      });
    });
  }

  List<FlSpot> _createSpots() {
    List<FlSpot> spots = [];
    Random random = Random();

    for (int j = 0; j < 13; j++) {
      spots.add(FlSpot(j.toDouble(), (random.nextInt(15) + 1).toDouble()));
    }

    return spots;
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consuming rate of Medicine'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 1.7,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: LineChart(
                    LineChartData(
                      minX: 0,
                      maxX: 12, // Range from 0 to 12 for 12 divisions
                      minY: 0,
                      maxY: 15,
                      titlesData: FlTitlesData(
                        bottomTitles: SideTitles(
                          showTitles: true,
                          interval: 1,
                          reservedSize: 30,
                          getTextStyles: (context, value) => const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                          getTitles: (value) {
                            switch (value.toInt()) {
                              case 0:
                                return '';
                              case 1:
                                return 'Jan';
                              case 2:
                                return 'Feb';
                              case 3:
                                return 'Mar';
                              case 4:
                                return 'Apr';
                              case 5:
                                return 'May';
                              case 6:
                                return 'Jun';
                              case 7:
                                return 'Jul';
                              case 8:
                                return 'Aug';
                              case 9:
                                return 'Sep';
                              case 10:
                                return 'Oct';
                              case 11:
                                return 'Nov';
                              case 12:
                                return 'Dec';
                              default:
                                return '';
                            }
                          },
                        ),
                        leftTitles: SideTitles(
                          showTitles: true,
                          getTitles: (value) {
                            return value.toInt().toString();
                          },
                        ),
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          spots: spots,
                          isCurved: true,
                          colors: [Colors.green],
                          barWidth: 2,
                          belowBarData: BarAreaData(
                            show: true,
                            colors: [
                              Color.fromRGBO(67, 177, 75, 1.0).withOpacity(0.1)
                            ],
                          ),
                          dotData: FlDotData(
                            show: true,
                            getDotPainter: (spot, percent, barData, index) {
                              return FlDotCirclePainter(
                                radius: 2,
                                color: Color.fromRGBO(67, 177, 75, 1.0),
                                strokeWidth: 2,
                                strokeColor: Colors.white,
                              );
                            },
                          ),
                        ),
                      ],
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: false,
                        drawHorizontalLine: true,
                        getDrawingHorizontalLine: (value) {
                          return FlLine(
                            color: Colors.grey,
                            strokeWidth: 0.5,
                          );
                        },
                        horizontalInterval: 1,
                      ),
                      lineTouchData: LineTouchData(
                        touchTooltipData: LineTouchTooltipData(
                          tooltipBgColor:
                              Color.fromRGBO(67, 177, 75, 1.0).withOpacity(0.8),
                          tooltipPadding: EdgeInsets.all(8),
                          getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                            return lineBarsSpot.map((lineBarSpot) {
                              return LineTooltipItem(
                                '${lineBarSpot.y.toInt().toString()}',
                                TextStyle(color: Colors.white),
                              );
                            }).toList();
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
