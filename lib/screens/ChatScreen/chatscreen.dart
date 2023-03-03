import 'package:flutter/material.dart';
import 'package:howie/constants.dart';
import 'package:howie/screens/ChatScreen/components/slider.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chatscreen';

  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColor4,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
              child: Row(
                children: [
                  Text(
                    "Howie.Ai",
                    style: fontstyle(30, weight: FontWeight.w500)
                        .copyWith(color: kColor2, letterSpacing: 2),
                  ),
                  Icon(
                    Icons.arrow_outward_rounded,
                    size: 30,
                    color: kColor2,
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: kColor5,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 6),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: kColor1,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.person,
                                color: kColor2,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text("Hey, There",
                              style: fontstyle(20, weight: FontWeight.w500)
                                  .copyWith(color: kColor2)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: kColor2,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Icon(
                        Icons.discord_outlined,
                        color: kColor1,
                      ),
                    ),
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Use smarter way to generate & communicate",
                softWrap: true,
                style: fontstyle(23).copyWith(color: kColor2),
              ),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                color: kColor5,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.63,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: SliderWidget())
                  ],
                ),
              ),
            ),
            Container(
              color: kColor5,
              child: SizedBox(
                height: 150,
                child: Stack(alignment: Alignment.topCenter, children: [
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 120,
                      decoration: BoxDecoration(
                        color: kColor2,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, left: 15, right: 15),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: SizedBox(
                                // height: 60,
                                child: TextField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: kColor5,
                                    hintText: "Type Here",
                                    hintStyle:
                                        fontstyle(18, weight: FontWeight.w500)
                                            .copyWith(color: kColor2),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide.none,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: kColor1,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.mic_none_rounded,
                                  color: kColor2.withOpacity(0.7),
                                  size: 36,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: kColor4,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: kColor2,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Icon(Icons.spa, color: kColor1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            )
            // )
          ],
        ),
      ),
    );
  }
}
