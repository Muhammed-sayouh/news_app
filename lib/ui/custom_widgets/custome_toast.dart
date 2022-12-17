import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../theme/style/colors.dart';

void customToast(String msg  ,{bool shortLenth = true}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength:shortLenth? Toast.LENGTH_SHORT:Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,

      backgroundColor:AppColors.mainColor,
      textColor: Colors.white,
      fontSize: 16.0);
}
