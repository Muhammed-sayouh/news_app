import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helpers/constants.dart';
import '../../view_model/home_view_model.dart';
import '../theme/sizes/sizes.dart';
import '../theme/style/colors.dart';
import '../theme/style/font_style.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Constants.somethingWrong),
            const BigPadding(),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.mainColor),
                fixedSize: MaterialStateProperty.all(
                  Size(
                    width(context, 0.35),
                    height(context, 0.05),
                  ),
                ),
              ),
              onPressed: () {
                Provider.of<HomeViewModel>(context, listen: false)
                    .fetchEgyptNews();
                Provider.of<HomeViewModel>(context, listen: false)
                    .fetchBBCNews();
              },
              child: Text(
                Constants.refresh,
                style: smallBlackFont().copyWith(color: Colors.white ,fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
    );
  }
}
