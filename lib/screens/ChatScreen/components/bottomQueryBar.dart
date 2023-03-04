// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:howie/constants.dart';

class BottomQueryBar extends StatefulWidget {
  final TextEditingController controller;
  final Function onPressed;

  const BottomQueryBar({
    required this.onPressed,
    required this.controller,
    super.key,
  });

  @override
  State<BottomQueryBar> createState() => _BottomQueryBarState();
}

class _BottomQueryBarState extends State<BottomQueryBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Stack(alignment: Alignment.topCenter, children: [
        Positioned(
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            decoration: BoxDecoration(
              color: kColor2,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(60),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: SizedBox(
                      // height: 60,
                      child: TextField(
                        controller: widget.controller,
                        style: fontstyle(20).copyWith(color: kColor2),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: kColor5,
                          hintText: "Type Here",
                          hintStyle: fontstyle(18, weight: FontWeight.w500)
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
          child: Container(
            decoration: BoxDecoration(
              color: kColor5,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: kColor2,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: IconButton(
                    iconSize: 35,
                    icon: const Icon(Icons.spa),
                    color: kColor1,
                    onPressed: () {
                      widget.onPressed();
                    }),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
