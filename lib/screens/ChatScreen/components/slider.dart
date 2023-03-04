import 'package:flutter/material.dart';
import 'package:howie/constants.dart';
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
    return SlideAction(
      height: 50,
      elevation: 5,
      outerColor: kColor1,
      // innerColor: kColor4,
      innerColor: kColor2,

      sliderButtonIconPadding: 0,
      sliderButtonIcon: Icon(
        Icons.change_circle_rounded,
        color: kColor4,
        size: 40,
      ),
      text: "Slide to regenerate ...",
      textStyle:
          fontstyle(16, weight: FontWeight.w500).copyWith(color: kColor2),
      // onSubmit: () {
      //   // Navigator.popAndPushNamed(context, ChatScreen.id);
      // },
    );
  }
}
