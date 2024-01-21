import 'package:WeCare/welcome_user.dart';
import 'package:flutter/material.dart';
import 'package:WeCare/getstarted.dart';
import 'package:WeCare/loginui.dart';
import 'package:WeCare/mybot.dart';
import 'package:WeCare/register.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          elevation: 0,
          flexibleSpace: Column(
            children: [
              const SizedBox(
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
        bottom: false, // Set this to false to prevent bottom overflow
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
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
                  child: const Text('Get started'),
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
                  child: const Text('Chatbot'),
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
