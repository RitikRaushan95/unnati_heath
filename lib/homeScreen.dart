import 'package:WeCare/Welcome.dart';
import 'package:WeCare/graph.dart';
import 'package:WeCare/welcome_user.dart';
import 'package:flutter/material.dart';
import 'package:WeCare/getstarted.dart';
import 'package:WeCare/loginui.dart';
import 'package:WeCare/mybot.dart';
import 'package:WeCare/register.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          elevation: 0,
          flexibleSpace: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Start()));
                },
                child: Container(
                  color: Color.fromRGBO(67, 177, 75, 1.0),
                  height: 20,
                  width: 100,
                  child: Text('Get started'),
                ),
              ),
              SizedBox(height: 50),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginUi()));
                },
                child: Container(
                  color: Color.fromRGBO(67, 177, 75, 1.0),
                  height: 20,
                  width: 100,
                  child: Text('Go to login ui'),
                ),
              ),
              SizedBox(height: 50),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignupPage()));
                },
                child: Container(
                  color: Color.fromRGBO(67, 177, 75, 1.0),
                  height: 20,
                  width: 100,
                  child: Text('Go to register'),
                ),
              ),
              SizedBox(height: 50),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => chatbot()));
                },
                child: Container(
                  color: Color.fromRGBO(67, 177, 75, 1.0),
                  height: 20,
                  width: 100,
                  child: Text('Chatbot'),
                ),
              ),
              SizedBox(height: 50),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WelcomeUser()));
                },
                child: Container(
                  color: Color.fromRGBO(67, 177, 75, 1.0),
                  height: 20,
                  width: 100,
                  child: Text('WelcomeUser'),
                ),
              ),
              SizedBox(height: 50),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LineGraph()));
                },
                child: Container(
                  color: Color.fromRGBO(67, 177, 75, 1.0),
                  height: 20,
                  width: 100,
                  child: Text('LineGraph'),
                ),
              ),
              SizedBox(height: 50),
              SizedBox(height: 10),
              Center(
                child: Text(
                  "This is home screen",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
