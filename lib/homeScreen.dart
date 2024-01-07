import 'package:flutter/material.dart';
import 'package:UnnatiHealth/getstarted.dart';
import 'package:UnnatiHealth/loginui.dart';
import 'package:UnnatiHealth/mybot.dart';
import 'package:UnnatiHealth/register.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFEC515D),
      ),
      body:  SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap:(){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>Start()
              ));},
              child:  Container(
              color: Colors.red,
              height: 20,
              width: 100,
              child: Text(
                'Get start'
              ),
            ),
           
            ),
     const SizedBox(height: 50),
            InkWell(
              onTap:(){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginUi()
              ));},
              child:  Container(
              color: Colors.red,
              height: 20,
              width: 100,
              child: Text(
                'Go to login ui'
              ),
            ),
           
            ),
               const SizedBox(height: 50),
             InkWell(
              onTap:(){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPage()
              ));},
              child:  Container(
              color: Colors.red,
              height: 20,
              width: 100,
              child: Text(
                'Go to register'
              ),
            ),
            ),
                 const SizedBox(height: 50),
            InkWell(
              onTap:(){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>chatbot()
              ));},
              child:  Container(
              color: Colors.red,
              height: 20,
              width: 100,
              child: Text(
                'Cahtbot'
              ),
            ), 
            ),
             const SizedBox(height: 50),
            
     const SizedBox(height: 50),

            Center(
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
