import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData getTheme() {
  return ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),
    scaffoldBackgroundColor: AppColors.darkWhite,
    fontFamily: 'Cairo',
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0,
    ),

  );
}
