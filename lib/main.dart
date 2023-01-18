import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:howie/constants.dart';
import 'package:howie/screens/ChatScreen/chatscreen.dart';
import 'package:howie/screens/HomeScreen/homescreen.dart';
import 'package:howie/screens/LandingScreen/landingscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: kprimarycolor1,
      systemNavigationBarColor: ksecondarycolor2));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ChatScreen.id,
      routes: {
        LandingScreen.id: (context) => const LandingScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
