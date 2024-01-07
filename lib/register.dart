import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:UnnatiHealth/loginui.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Color.fromRGBO(67, 177, 75, 1.0),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                // Handle login action here
              },
              child: const Text(
                "Login",
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(67, 177, 75, 1.0),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        children: <Widget>[
          const SizedBox(height: 20),
          Center(
            child: const Text(
              "Register Now",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Center(
            child: Text(
              "Create an account",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            children: <Widget>[
              inputFile(label: "Name"),
              inputFile(label: "Password", obscureText: true),
              inputFile(label: "Confirm Password ", obscureText: true),
              inputFile(label: "E-mail Address"),
              inputFile(label: "Mobile Number"),

              // Add Dropdown for selecting role
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Select your role',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F1F1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: PopupMenuButton<String>(
                      itemBuilder: (BuildContext context) {
                        return <PopupMenuEntry<String>>[
                          PopupMenuItem<String>(
                            value: 'Doctor',
                            child: Text('Doctor'),
                          ),
                          PopupMenuItem<String>(
                            value: 'Family member',
                            child: Text('Family member'),
                          ),
                          PopupMenuItem<String>(
                            value: 'Women',
                            child: Text('Women'),
                          ),
                          PopupMenuItem<String>(
                            value: 'Patient',
                            child: Text('Patient'),
                          ),
                        ];
                      },
                      onSelected: (String value) {
                        _updateSelectedRole(value);
                      },
                      child: Row(
                        children: [
                          Text(
                            selectedRole ?? 'Select role',
                            style: const TextStyle(color: Colors.black),
                          ),
                          const Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  color: Color.fromRGBO(67, 177, 75, 1.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () {
                    //call register function here
                    // register(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account ?"),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginUi(),
                    ),
                  );
                },
                child: const Text(
                  "Sign in",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  void _updateSelectedRole(String role) {
    setState(() {
      selectedRole = role;
    });
  }
}

// Widget for text field
Widget inputFile({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87,
        ),
      ),
      const SizedBox(height: 5),
      Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF1F1F1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextFormField(
            obscureText: obscureText,
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter $label',
              hintStyle: const TextStyle(fontSize: 14),
            ),
          ),
        ),
      ),
      const SizedBox(height: 10),
    ],
  );
}

void main() {
  runApp(MaterialApp(
    home: SignupPage(),
  ));
}
