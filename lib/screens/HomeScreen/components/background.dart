import 'package:flutter/material.dart';
import 'package:howie/constants.dart';

class Background extends StatelessWidget {
  const Background({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(kColor4, BlendMode.color),
        child: Image.asset(
          'assets/background.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
