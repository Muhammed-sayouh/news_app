import 'package:flutter/material.dart';

class Navigators {
  static void getTo(BuildContext context, dynamic route) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => route,
      ),
    );
  }

  static void getOffAll(BuildContext context, dynamic route) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => route),
        (Route<dynamic> route) => false);
  }

  static void back(BuildContext context) {
    Navigator.of(context).pop();
  }
}
