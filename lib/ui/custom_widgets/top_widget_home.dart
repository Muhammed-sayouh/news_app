import 'package:flutter/material.dart';

import '../../helpers/constants.dart';
import '../theme/sizes/sizes.dart';
import '../theme/style/font_style.dart';

class TopWidgetHomeScreen extends StatelessWidget {
  const TopWidgetHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      height: height(context, 0.15),
      width: width(context, 1),
      color: Colors.white ,
      child: Padding(
        padding:commonPaddingHorizental(context , virtical: 10),
        child: Text(
          Constants.news,
          style: titleStyle()
              .copyWith(fontWeight: FontWeight.bold, fontSize: 26),
        ),
      ),
    );
  }
}
