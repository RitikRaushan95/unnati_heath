import 'package:flutter/material.dart';

void main() {
  runApp(Availability());
}

class Availability extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom AppBar Example',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        appBar: CustomAppBar(),
        body: AvailabilityBody(),
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
        SizedBox(height: 20), // Add space between AppBar and Container
        Row(
          children: [
            Icon(Icons.chevron_left),
            Expanded(
              child: Container(
                height: 80,
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
                    SizedBox(height: 10), // Add space between rows
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
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recommendations',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              _buildDoctorRecommendationItem(
                "Dr Olivia Wilson",
                "consultant-physiotheraphy",
                "assets/profile_image1.png",
                4,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTimeContainer('09:00'),
                  _buildTimeContainer('10:00'),
                  _buildTimeContainer('11:00'),
                  _buildTimeContainer('12:00'),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTimeContainer('13:00'),
                  _buildTimeContainer('14:00'),
                  _buildTimeContainer('15:00'),
                  _buildTimeContainer('16:00'),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTimeContainer('17:00'),
                  _buildTimeContainer('18:00'),
                  _buildTimeContainer('19:00'),
                  _buildTimeContainer('20:00'),
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
            // Add your book action here
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
            Navigator.pop(context);
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
