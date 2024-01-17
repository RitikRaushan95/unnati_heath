import 'dart:convert';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class chatbot extends StatefulWidget {
  const chatbot({super.key});

  @override
  State<chatbot> createState() => _chatbotState();
}

class _chatbotState extends State<chatbot> {
  ChatUser myself = ChatUser(id: '1', firstName: 'ritik');
  ChatUser bot = ChatUser(id: '2', firstName: 'Gemini');

  List<ChatMessage> allMessages = [];
  List<ChatUser> typing = [];

  final oururl =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyCHv5QFowK1eKuYtPYZgZBhn8UxmQJfR3A';
  final header = {'Content-Type': 'application/json'};
  getdata(ChatMessage m) async {
    typing.add(bot);
    allMessages.insert(0, m);
    setState(() {});
    var data = {
      "contents": [
        {
          "parts": [
            {"text": m.text}
          ]
        }
      ]
    };
    await http
        .post(Uri.parse(oururl), headers: header, body: jsonEncode(data))
        .then((value) {
      if (value.statusCode == 200) {
        var result = jsonDecode(value.body);
        //  print(result['candidates'][0]['content']['parts'][0]['text']);

        ChatMessage m1 = ChatMessage(
            text: result['candidates'][0]['content']['parts'][0]['text'],
            user: bot,
            createdAt: DateTime.now());
        allMessages.insert(0, m1);
      } else {
        print("error");
      }
    }).catchError((e) {});
    typing.remove(bot);
    setState(() {});
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            ),
          ),
          backgroundColor: const Color.fromRGBO(67, 177, 75, 1.0),
          title: const Text('Chat Support'),
        ),
        body: DashChat(
            typingUsers: typing,
            currentUser: myself,
            onSend: (ChatMessage m) {
              getdata(m);
            },
            messages: allMessages));
  }
}
