import 'package:flutter/material.dart';

final BorderRadius radius = BorderRadius.circular(6.0);

final ThemeData appTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Color(0xff0a0b0f),
  primaryColor: Colors.red,
  unselectedWidgetColor: Color(0xff515565),
  hintColor: Color(0xff858585),
  disabledColor: Colors.black,
  highlightColor: Colors.white,

  ///appBar theme
  appBarTheme: AppBarTheme(
    color: Colors.transparent,
    elevation: 0.0,
    iconTheme: IconThemeData(color: Colors.white),
  ),

  bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent),

  ///text theme
  textTheme: TextTheme(
    bodyText1: TextStyle(),
    bodyText2: TextStyle(),
    subtitle1: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
    subtitle2: TextStyle(),
    headline1: TextStyle(),
    headline2: TextStyle(),
    headline3: TextStyle(),
    headline4: TextStyle(),
    headline5: TextStyle(),
    headline6: TextStyle(),
    button: TextStyle(),
    overline: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.5),
  ).apply(bodyColor: Colors.white),
);

final TextStyle bottomBarTextStyle = TextStyle(
  fontSize: 15.0,
  color: Colors.white,
  fontWeight: FontWeight.w400,
);

/// NAME         SIZE  WEIGHT  SPACING
/// headline1    96.0  light   -1.5
/// headline2    60.0  light   -0.5
/// headline3    48.0  regular  0.0
/// headline4    34.0  regular  0.25
/// headline5    24.0  regular  0.0
/// headline6    20.0  medium   0.15
/// subtitle1    16.0  regular  0.15
/// subtitle2    14.0  medium   0.1
/// body1        16.0  regular  0.5   (bodyText1)
/// body2        14.0  regular  0.25  (bodyText2)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5
