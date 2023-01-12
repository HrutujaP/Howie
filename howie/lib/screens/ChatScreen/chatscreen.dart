import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:howie/constants.dart';
import 'package:howie/screens/ChatScreen/components/messagebubble.dart';
import 'package:http/http.dart' as http;

class ChatScreen extends StatelessWidget {
  static const String id = 'chatScreen';

  ChatScreen({super.key});

  late String query;

  void sendQuery(String query) async {
    var url = 'https://49.37.168.119:3000/message';

    var data = {'prompt': query};

    try {
      http.post(Uri.parse(url),headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }, body: jsonEncode(data)).then((response) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      });
    } catch (e) {
      print(e);
    }

    // print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: ksecondarycolor1,
          gradient: LinearGradient(
            colors: [
              kprimarycolor1,
              kprimarycolor1,
              kprimarycolor2,
              ksecondarycolor1,
              ksecondarycolor2,
              ksecondarycolor2,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.height * 0.1),
                        color: Colors.grey.withOpacity(0.7)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.height * 0.035,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'Howie',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.height * 0.2),
                        color: kprimarycolor2.withOpacity(0.5)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image(
                        image: const AssetImage('assets/howie_icon.png'),
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const MessageBubble(sender: 'Howie', text: 'Hellow', isMe: false),
              const MessageBubble(sender: 'Me', text: 'Hii', isMe: true),
              const Spacer(),
              Container(
                decoration: kMessageContainerDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          query = value;
                        },
                        decoration: kMessageTextFieldDecoration,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        sendQuery(query);
                      },
                      child: const Text(
                        'Send',
                        style: kSendButtonTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
