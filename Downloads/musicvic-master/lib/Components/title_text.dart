import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String title;

  TitleText(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Text(
        title,
        style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 18),
      ),
    );
  }
}
