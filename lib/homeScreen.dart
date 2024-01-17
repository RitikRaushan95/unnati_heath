import 'package:WeCare/welcome_user.dart';
import 'package:flutter/material.dart';
import 'package:WeCare/getstarted.dart';
import 'package:WeCare/loginui.dart';
import 'package:WeCare/mybot.dart';
import 'package:WeCare/register.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(67, 177, 75, 1.0),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Start()));
              },
              child: Container(
                color: const Color.fromRGBO(67, 177, 75, 1.0),
                height: 20,
                width: 100,
                child: const Text('Get start'),
              ),
            ),
            const SizedBox(height: 50),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginUi()));
              },
              child: Container(
                color: const Color.fromRGBO(67, 177, 75, 1.0),
                height: 20,
                width: 100,
                child: const Text('Go to login ui'),
              ),
            ),
            const SizedBox(height: 50),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignupPage()));
              },
              child: Container(
                color: const Color.fromRGBO(67, 177, 75, 1.0),
                height: 20,
                width: 100,
                child: const Text('Go to register'),
              ),
            ),
            const SizedBox(height: 50),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const chatbot()));
              },
              child: Container(
                color: const Color.fromRGBO(67, 177, 75, 1.0),
                height: 20,
                width: 100,
                child: const Text('Cahtbot'),
              ),
            ),
            const SizedBox(height: 50),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WelcomeUser()));
              },
              child: Container(
                color: const Color.fromRGBO(67, 177, 75, 1.0),
                height: 20,
                width: 100,
                child: const Text('WelcomeUser'),
              ),
            ),
            const SizedBox(height: 50),
            const SizedBox(height: 50),
            const Center(
              child: Text(
                "This is homescreen",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
