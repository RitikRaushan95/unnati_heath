import 'package:WeCare/availability.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Appointment());
}

class Appointment extends StatefulWidget {
  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  String _selectedText = ''; // Track the selected text

  // Track the checklist items
  bool _isParacetamolChecked = false;
  bool _isDigeneTabletsChecked = false;
  bool _isAnotherItemChecked = false;

  // Build a checklist item widget
  Widget _buildChecklistItem(
      String itemName, bool isChecked, ValueChanged<bool?>? onChanged) {
    return Row(
      children: [
        Expanded(
          child: Text(itemName),
        ),
        Checkbox(
          value: isChecked,
          onChanged: onChanged,
          visualDensity: VisualDensity.compact,
          shape: CircleBorder(),
          checkColor: Color.fromARGB(255, 112, 238, 119),
          activeColor: Color.fromARGB(255, 112, 238,
              119), // Change the color of the checkbox when selected
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Full Width Image',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 112, 238, 119),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor:
              Colors.white, // Set bottom navigation bar color to white
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 20,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/healthcare_image1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr Asha Kashyap',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Dermatologist',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.location_on,
                            color: Color.fromARGB(255, 112, 238, 119),
                            size: 16),
                        SizedBox(width: 5),
                        Text(
                          'Danapur, Patna, Bihar',
                          style: TextStyle(fontSize: 14),
                        ),
                        Spacer(),
                        Text(
                          'Rs 500',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 112, 238, 119),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            '4.9',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Very Good',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(
                      color: Colors.grey,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Select Time',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildSelectableText('09:00'),
                          SizedBox(width: 30),
                          _buildSelectableText('10:00'),
                          SizedBox(width: 30),
                          _buildSelectableText('11:00'),
                          SizedBox(width: 30),
                          _buildSelectableText('12:00'),
                          SizedBox(width: 30),
                          _buildSelectableText('13:00'),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedText = 'Issues';
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 3.5,
                            alignment: Alignment.center,
                            child: Text(
                              'Issues',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedText = 'Prescription';
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 3.5,
                            alignment: Alignment.center,
                            child: Text(
                              'Prescription',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedText = 'Review';
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 3.5,
                            alignment: Alignment.center,
                            child: Text(
                              'Review',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 2,
                          width: MediaQuery.of(context).size.width / 3.5,
                          color: _selectedText == 'Issues'
                              ? Color.fromARGB(255, 112, 238, 119)
                              : Colors.transparent,
                        ),
                        Container(
                          height: 2,
                          width: MediaQuery.of(context).size.width / 3.5,
                          color: _selectedText == 'Prescription'
                              ? Color.fromARGB(255, 112, 238, 119)
                              : Colors.transparent,
                        ),
                        Container(
                          height: 2,
                          width: MediaQuery.of(context).size.width / 3.5,
                          color: _selectedText == 'Review'
                              ? Color.fromARGB(255, 112, 238, 119)
                              : Colors.transparent,
                        ),
                      ],
                    ),
                    if (_selectedText == 'Issues')
                      Column(
                        children: [
                          SizedBox(height: 20),
                          _buildChecklistItem(
                            'Hairs',
                            _isParacetamolChecked,
                            (bool? isChecked) {
                              if (isChecked != null) {
                                setState(() {
                                  _isParacetamolChecked = isChecked;
                                });
                              }
                            },
                          ),
                          _buildChecklistItem(
                            'Nails',
                            _isDigeneTabletsChecked,
                            (bool? isChecked) {
                              if (isChecked != null) {
                                setState(() {
                                  _isDigeneTabletsChecked = isChecked;
                                });
                              }
                            },
                          ),
                          _buildChecklistItem(
                            'Skin',
                            _isAnotherItemChecked,
                            (bool? isChecked) {
                              if (isChecked != null) {
                                setState(() {
                                  _isAnotherItemChecked = isChecked;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Thank you"),
                      content: Text(
                          "Your appointment has been successfull booked !!."),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Availability(),
                              ),
                            );
                          },
                          child: Text("OK"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                'Book Appointment',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 112, 238, 119),
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSelectableText(String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedText = text;
        });
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
              color: _selectedText == text
                  ? Color.fromARGB(255, 112, 238, 119)
                  : Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
