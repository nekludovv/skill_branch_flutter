import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'colors.dart';

TextTheme buildAppTextTheme() {
  return TextTheme(
    headline6: TextStyle( // h6
      fontSize: 12,
      height: 20 / 12,
      letterSpacing: -0.24,
      fontWeight: FontWeight.w300,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
    ),
    headline5: TextStyle( // h5Black
      fontSize: 13,
      height: 18 / 13,
      fontWeight: FontWeight.normal,
      color: AppColors.black,
      fontStyle: FontStyle.normal,
      fontFamily: 'Roboto',
    ),
    headline4: TextStyle( //h4
      fontSize: 14,
      height: 16 / 14,
      color: AppColors.alto,
      fontWeight: FontWeight.w600,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      letterSpacing: 0.75,
    ),
    headline3: TextStyle( //h3
      fontSize: 14,
      height: 20 / 14,
      color: AppColors.manatee,
      fontWeight: FontWeight.normal,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      letterSpacing: 0.25,
    ),
    headline2: TextStyle( // h2Black
      fontSize: 17,
      height: 22 / 17,
      fontFamily: 'Roboto',
      color: AppColors.black,
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.normal,
      letterSpacing: -0.41,
    ),
    headline1: TextStyle( // h1Black
      fontSize: 18,
      height: 23 / 18,
      color: AppColors.black,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
    ),
  );
}