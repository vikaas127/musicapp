import 'package:flutter/material.dart';

class ButtonWithIcon extends StatelessWidget {
  final Color color;
  final Color textColor;
  final Color borderColor;
  final String image;
  final String label;
  final Function onTap;
  final Icon icon;

  ButtonWithIcon({
    this.color,
    this.textColor,
    this.image,
    this.label,
    this.borderColor,
    this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton.icon(
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: 0.5,
          ),
        ),
        color: color ?? Colors.transparent,
        onPressed: onTap ?? () {},
        icon: Padding(
          padding: EdgeInsets.all(16.0),
          child: icon ??
              Image.asset(
                image,
                scale: image == 'assets/ic_fb.png' ? 1.7 : 3,
              ),
        ),
        label: Text(
          label,
          style:
              Theme.of(context).textTheme.bodyText1.copyWith(color: textColor),
        ),
      ),
    );
  }
}
