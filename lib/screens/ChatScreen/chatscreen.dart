import 'package:howie/functions.dart';
import 'package:howie/screens/ChatScreen/components/topWidget.dart';
import 'package:flutter/material.dart';
import 'package:howie/constants.dart';
import 'package:howie/screens/ChatScreen/components/bottomQueryBar.dart';
import 'package:howie/screens/ChatScreen/components/slider.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chatscreen';

  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _queryController = TextEditingController();
  String query = "";
  String reply = "";
  bool isWaiting = false;

  void onPressed() async {
    setState(() {
      isWaiting = true;
      query = "${_queryController.text} -";
      _queryController.clear();
    });
    sendQuery(query).then((value) {
      setState(() {
        reply = value;
        isWaiting = false;
      });
    });
    // print("query : $query");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColor4,
      body: SafeArea(
        child: Column(
          children: [
            const TopWidget(),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: kColor5,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: const SliderWidget()),
                          const SizedBox(height: 15),
                          Text(query,
                              style: fontstyle(25, weight: FontWeight.w500)
                                  .copyWith(color: kColor2)),
                          const SizedBox(height: 10),
                          !isWaiting
                              ? SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  child: SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    child: Text(reply,
                                        softWrap: true,
                                        style: fontstyle(20).copyWith(
                                            color: kColor2.withOpacity(0.5))),
                                  ),
                                )
                              : Center(
                                  child: CircularProgressIndicator(
                                    color: kColor2.withOpacity(0.7),
                                  ),
                                ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: BottomQueryBar(
                          controller: _queryController, onPressed: onPressed)),
                ],
              ),
            ),
            // )
          ],
        ),
      ),
    );
  }
}
