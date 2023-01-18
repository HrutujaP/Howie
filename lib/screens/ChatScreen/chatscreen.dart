import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:howie/constants.dart';
import 'package:howie/screens/ChatScreen/components/messagebubble.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;

class ChatScreen extends StatelessWidget {
  static const String id = 'chatScreen';

  ChatScreen({super.key});

  final messageTextController = TextEditingController();
  late String query;

  Future<String> sendQuery(String query) async {
    print(query);
    var url = 'https://howiebackend.onrender.com/api/query/message';

    var data = {'prompt': query};
    try {
      String reply = await http
          .post(Uri.parse(url),
              headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
              },
              body: jsonEncode(data))
          .then((response) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');

        String reply = jsonDecode(response.body)['message'];
        reply = reply.replaceAll(RegExp(r"\t|\n"), "");

        return reply;
      });

      return reply;
    } catch (e) {
      print(e);
      return 'Error';
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
                  Spacer(),
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
              const Spacer(),
              MessagesStream(),
              Container(
                decoration: kMessageContainerDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: messageTextController,
                        onChanged: (value) {
                          query = value;
                        },
                        decoration: kMessageTextFieldDecoration,
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        messageTextController.clear();
                        _firestore
                            .collection('users')
                            .doc('6363850983')
                            .collection('messages')
                            .doc()
                            .set({
                          'isBot': false,
                          'message': query,
                          'time': DateTime.now()
                        });
                        String reply = await sendQuery(query);
                        _firestore
                            .collection('users')
                            .doc('6363850983')
                            .collection('messages')
                            .doc()
                            .set({
                          'isBot': true,
                          'message': reply,
                          'time': DateTime.now()
                        });
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

class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('users')
          .doc('6363850983')
          .collection('messages')
          .orderBy('time')
          .snapshots(),
      builder: (context, snapshot) {
        List<MessageBubble> messageBubbles = [];
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlue,
            ),
          );
        }
        final messages = snapshot.data?.docs.reversed;
        for (var message in messages!) {
          try {
            final messageText = message['message'] as String;
            final messageSender = (message['isBot']) as bool;
            print(messageText);

            final messageBubble = MessageBubble(
              sender: messageSender ? 'Howie' : 'You',
              text: messageText,
              isMe: messageSender,
            );
            messageBubbles.add(messageBubble);
          } catch (E) {
            print(E);
          }
        }

        return Expanded(
          flex: 100,
          child: ListView(
            children: messageBubbles,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            reverse: true,
          ),
        );
      },
    );
  }
}
