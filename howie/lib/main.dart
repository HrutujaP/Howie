import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:howie/constants.dart';
import 'package:howie/screens/ChatScreen/chatscreen.dart';
import 'package:howie/screens/HomeScreen/homescreen.dart';
import 'package:howie/screens/LandingScreen/landingscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: kprimarycolor1,
      systemNavigationBarColor: ksecondarycolor2));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ChatScreen.id,
      routes: {
        LandingScreen.id: (context) => const LandingScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        ChatScreen.id: (context) =>  ChatScreen(),
      },
    );
  }
}
