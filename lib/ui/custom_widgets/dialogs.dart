import 'package:flutter/material.dart';

import '../../helpers/constants.dart';
import '../theme/sizes/sizes.dart';
import '../theme/style/colors.dart';

void loadingDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Directionality(
        textDirection: TextDirection.ltr,
        child: AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(
                color: AppColors.mainColor,
              ),
              SizedBox(
                width: width(context, 0.05),
              ),
              Text(Constants.loading)
            ],
          ),
        ),
      );
    },
  );
}
