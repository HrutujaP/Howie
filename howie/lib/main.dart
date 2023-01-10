import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:howie/constants.dart';
import 'package:howie/screens/HomeScreen/homescreen.dart';
import 'package:howie/screens/LandingScreen/landingscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: kprimarycolor1,
      systemNavigationBarColor: kprimarycolor1));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.id,
      routes: {
        LandingScreen.id: (context) => LandingScreen(),
        HomeScreen.id: (context) => HomeScreen()
      },
    );
  }
}
