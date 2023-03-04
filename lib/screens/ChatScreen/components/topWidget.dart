import 'package:flutter/material.dart';
import 'package:howie/constants.dart';


class TopWidget extends StatelessWidget {
  const TopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
