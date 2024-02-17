import 'package:WeCare/appointment.dart';
import 'package:WeCare/recommendations.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Availability());
}

class Availability extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom AppBar Example',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        appBar: CustomAppBar(),
        body: AvailabilityBody(),
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
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
        ),
      ),
    );
  }
}

class AvailabilityBody extends StatefulWidget {
  @override
  _AvailabilityBodyState createState() => _AvailabilityBodyState();
}

class _AvailabilityBodyState extends State<AvailabilityBody> {
  List<bool> _selectedDates = List.generate(7, (_) => false);
  int _selectedDayIndex = -1;

  void _selectDate(int index) {
    setState(() {
      _selectedDates = List.generate(7, (_) => false); // Reset all dates
      _selectedDates[index] = true;
      _selectedDayIndex = (index + DateTime.now().weekday - 1) % 7;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10), // Reduce space between AppBar and Container
        Row(
          children: [
            Icon(Icons.chevron_left),
            Expanded(
              child: Container(
                height: 70, // Reduce the height of the container
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey),
                    bottom: BorderSide(color: Colors.grey),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        for (var day in [
                          'SUN',
                          'MON',
                          'TUE',
                          'WED',
                          'THU',
                          'FRI',
                          'SAT'
                        ])
                          Text(
                            day,
                            style: TextStyle(
                              color: _selectedDayIndex ==
                                      (DateTime.now().weekday +
                                              [
                                                'SUN',
                                                'MON',
                                                'TUE',
                                                'WED',
                                                'THU',
                                                'FRI',
                                                'SAT'
                                              ].indexOf(day) -
                                              1) %
                                          7
                                  ? Color.fromRGBO(67, 177, 75, 1.0)
                                  : Colors.black,
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 5), // Reduce space between rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        for (int i = 13; i <= 19; i++)
                          GestureDetector(
                            onTap: () => _selectDate(i - 13),
                            child: Container(
                              decoration: BoxDecoration(
                                color: _selectedDates[i - 13]
                                    ? Color.fromRGBO(67, 177, 75, 1.0)
                                    : null,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.all(8),
                              child: Text(
                                '$i',
                                style: TextStyle(
                                  color: _selectedDates[i - 13]
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Icon(Icons.chevron_right),
          ],
        ),
        SizedBox(height: 10), // Reduce space after AppBar content
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recommendations',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                  height:
                      10), // Reduce space between header and doctor container
              _buildDoctorRecommendationItem(
                "Dr Olivia Wilson",
                "consultant-physiotheraphy",
                "assets/profile_image1.png",
                4,
              ),
              SizedBox(
                  height:
                      10), // Reduce space between doctor container and time rows
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTimeContainer('09:00'),
                  _buildTimeContainer('10:00'),
                  _buildTimeContainer('11:00'),
                  _buildTimeContainer('12:00'),
                ],
              ),
              SizedBox(height: 5), // Reduce space between rows
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTimeContainer('13:00'),
                  _buildTimeContainer('14:00'),
                  _buildTimeContainer('15:00'),
                  _buildTimeContainer('16:00'),
                ],
              ),
              SizedBox(
                  height:
                      10), // Reduce space between time rows and doctor container
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTimeContainer('17:00'),
                  _buildTimeContainer('18:00'),
                  _buildTimeContainer('19:00'),
                  _buildTimeContainer('20:00'),
                ],
              ),
              SizedBox(
                  height:
                      10), // Reduce space between doctor container and divider
              Divider(color: Colors.grey), // Grey horizontal line
              SizedBox(height: 10), // Reduce space after divider
              _buildDoctorRecommendationItem(
                "Dr Aditi Wats",
                "consultant-Gynecologist",
                "assets/profile_image5.png",
                4,
              ), // Second doctor container
              SizedBox(height: 10), // Reduce space before time rows
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTimeContainer('09:00'),
                  _buildTimeContainer('10:00'),
                  _buildTimeContainer('11:00'),
                  _buildTimeContainer('12:00'),
                ],
              ),
              SizedBox(height: 5), // Reduce space between rows
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTimeContainer('13:00'),
                  _buildTimeContainer('14:00'),
                  _buildTimeContainer('15:00'),
                  _buildTimeContainer('16:00'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDoctorRecommendationItem(
      String name, String specialization, String imagePath, int rating) {
    return Row(
      children: [
        SizedBox(width: 20),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
          child: CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: 30,
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 15),
              ),
              Text(
                specialization,
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
              Row(
                children: List.generate(
                  rating,
                  (index) => Icon(Icons.star, color: Colors.yellow, size: 20),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Appointment(),
              ),
            );
          },
          child: Text('Book', style: TextStyle(color: Colors.black)),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromRGBO(67, 177, 75, 1.0)),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeContainer(String time) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(time),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      leading: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Recomend(),
              ),
            );
          },
        ),
      ),
      title: Center(
        child: Text(
          'JANUARY 2024',
          style: TextStyle(fontSize: 20),
        ),
      ),
      centerTitle: true,
    );
  }
}
