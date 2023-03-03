import 'package:flutter/material.dart';
import 'package:howie/constants.dart';
import 'package:howie/screens/ChatScreen/chatscreen.dart';
import 'package:slide_to_act/slide_to_act.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: SlideAction(
        elevation: 5,
        outerColor: kColor4,
        innerColor: kColor2,
        sliderButtonIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Icon(
            Icons.double_arrow_rounded,
            color: kColor4,
          ),
        ),
        text: "Slide to Pay",
        textStyle:
            fontstyle(20, weight: FontWeight.w500).copyWith(color: kColor2),
        onSubmit: () {
          Navigator.popAndPushNamed(context, ChatScreen.id);
        },
      ),
    );
  }
}
