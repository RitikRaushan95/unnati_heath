import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FeedbackForm(),
    );
  }
}

class FeedbackForm extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String _selectedRole = 'Select';
  final TextEditingController _suggestionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WeCare'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 500.0,
              maxHeight: 600.0, // Decreased container height
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Colors.grey,
                width: 2.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 8.0),
                        Icon(Icons.timer, color: Colors.green),
                        SizedBox(width: 8.0),
                        Text('It only takes two minutes!',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                    SizedBox(height: 8.0), // Decreased spacing
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person, color: Colors.green),
                        labelText: 'Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8.0), // Decreased spacing
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email, color: Colors.green),
                        labelText: 'Email',
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !value.contains('@')) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8.0), // Decreased spacing
                    TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone, color: Colors.green),
                        labelText: 'Phone',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8.0), // Decreased spacing
                    Row(
                      children: [
                        Icon(Icons.sentiment_very_satisfied,
                            color: Colors.green),
                        SizedBox(width: 8.0),
                        Text('Select your role:',
                            style: TextStyle(color: Colors.black)),
                        SizedBox(width: 8.0),
                        DropdownButton<String>(
                          value: _selectedRole,
                          onChanged: (value) {
                            setState(() {
                              _selectedRole = value!;
                            });
                          },
                          items: [
                            'Select',
                            'Patient',
                            'Doctor',
                            'Hospital',
                            'MediShop'
                          ]
                              .map<DropdownMenuItem<String>>(
                                (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Decreased spacing
                    Row(
                      children: [
                        Icon(Icons.chat, color: Colors.green),
                        SizedBox(width: 8.0),
                        Text('Write your valuable suggestion:',
                            style: TextStyle(color: Colors.black)),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      controller: _suggestionController,
                      maxLines: 4,
                      style: TextStyle(fontSize: 12.0), // Decreased font size
                      decoration: InputDecoration(
                        hintText: 'Type here...',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 10.0), // Adjust padding
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              8.0), // Decreased border radius
                          borderSide: BorderSide(
                            color: Colors.green, // Border color
                            width: 1.0, // Decreased border width
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your suggestion';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                        height: 16.0), // Increased spacing before the button
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Form is valid, send email
                          sendEmail();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: Size(double.infinity, 50),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void sendEmail() async {
    final String recipientEmail = _emailController.text;
    final String subject = 'Feedback Form Submission';
    final String body = '''
      Name: ${_nameController.text}
      Email: ${_emailController.text}
      Phone: ${_phoneController.text}
      Role: $_selectedRole
      Suggestion: ${_suggestionController.text}
  ''';

    final smtpServer = gmail('ritikraushan9534@gmail.com', 'Ritik@2004');

    final message = Message()
      ..from = Address('ritikraushan9534@gmail.com', 'Ritik Raushan')
      ..recipients.add(recipientEmail)
      ..subject = subject
      ..text = body;

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ${sendReport.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Feedback submitted successfully!'),
        ),
      );
    } catch (error) {
      print('Error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Feedback submitted successfully!'),
        ),
      );
    }
  }
}
