import 'package:flutter/material.dart';
import 'package:musicvic/Locale/locale.dart';

class ContinueButton extends StatelessWidget {
  final Function onTap;
  final String text;

  ContinueButton(this.onTap, {this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        margin: EdgeInsets.symmetric(vertical: 20.0),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(25)),
        child: Text(
          text ?? AppLocalizations.of(context).continueText,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
