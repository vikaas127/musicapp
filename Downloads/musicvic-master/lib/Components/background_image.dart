import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Blur(
      blur: 6,
      child: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/bg.png'), fit: BoxFit.cover)),
      ),
    );
  }
}
