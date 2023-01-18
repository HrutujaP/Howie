import 'package:flutter/material.dart';
import 'package:howie/constants.dart';


class HomeScreen extends StatelessWidget {
  static const id = 'homeScreen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
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
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
          child: Column(
            children: [
              Text(
                'Hi, I\'m Howie.',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: MediaQuery.of(context).size.height * 0.03),
                softWrap: true,
              ),
              Text(
                ' I can help you with',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: MediaQuery.of(context).size.height * 0.028),
                softWrap: true,
              ),
              const Image(image: AssetImage('assets/howie_gif.gif')),
              const Spacer(),
              Material(
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.5),
                elevation: 20,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      gradient: const LinearGradient(colors: [
                        kprimarycolor1,
                        kprimarycolor2,
                        ksecondarycolor1,
                        ksecondarycolor2,
                      ]),
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.5)),
                  child: const Center(
                      child: Text(
                    'Queries',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  )),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Material(
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.5),
                elevation: 20,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      gradient: const LinearGradient(colors: [
                        Colors.purpleAccent,
                        Colors.deepPurpleAccent,
                        Colors.blueAccent,
                        Colors.lightBlueAccent
                      ]),
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.5)),
                  child: const Center(
                      child: Text(
                    'Generate Imaginations',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
