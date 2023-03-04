import 'package:flutter/material.dart';
import 'package:howie/constants.dart';
import 'package:howie/screens/HomeScreen/components/background.dart';
import 'package:howie/screens/HomeScreen/components/slider.dart';

class HomeScreen extends StatelessWidget {
  static const id = 'homeScreen';

  const HomeScreen({super.key});

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          const Background(),
          // Container(
          //   child: Column(),

          // )

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          'Try imaginative powers of the human',
                          softWrap: true,
                          style: fontstyle(46),
                        ),
                      ),
                      Text(
                        'species',
                        style: fontstyle(55, weight: FontWeight.w500)
                            .copyWith(letterSpacing: 4),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const SliderWidget(),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
