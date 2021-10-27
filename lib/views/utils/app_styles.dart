import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AppStyles {
// Colors

  static const Color backgroundColor = Color(0XFF151617);
  static const Color goalBackgroundColor = Color(0XFF202324);

// Text Styles

  static const TextStyle mainGreenHeadingStyle = TextStyle(
    color: Colors.green,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold,
    fontSize: 24.0,
  );

  static const TextStyle whiteSubHeadingStyle = TextStyle(
    color: Colors.white,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w400,
    fontSize: 18.0,
  );

  static const TextStyle whiteTitleStyle = TextStyle(
    fontSize: 17.0,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle greySmallTextStyle = TextStyle(
    color: Colors.grey,
    fontSize: 12.0,
  );
}
