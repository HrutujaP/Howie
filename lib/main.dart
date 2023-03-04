// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:howie/screens/ChatScreen/chatscreen.dart';
import 'package:howie/screens/HomeScreen/homescreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ChatScreen.id,
      routes: {
        ChatScreen.id : (context) => const ChatScreen(),
        HomeScreen.id: (context) =>  HomeScreen(),
      },
    );
  }
}
