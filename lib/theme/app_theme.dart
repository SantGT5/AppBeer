import 'package:appbeer/theme/color_theme.dart';
import 'package:appbeer/theme/text_theme.dart';
import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: textTheme,
    primaryTextTheme: textTheme,
    scaffoldBackgroundColor: Colors.white,
    errorColor: AppColors.redError,
    colorScheme: lightColorScheme,
    primarySwatch: AppColors.secondary,
    backgroundColor: AppColors.white,
    inputDecorationTheme: inputTheme);

const InputDecorationTheme inputTheme =
    InputDecorationTheme(border: OutlineInputBorder());
