import 'package:flutter/material.dart';

import '../../model/news_model.dart';
import '../theme/sizes/sizes.dart';
import '../theme/style/colors.dart';
import '../theme/style/font_style.dart';

class NewsTitleAndContent extends StatelessWidget {
  ///contain  title and description of news , just pass [article]
  const NewsTitleAndContent({
    Key? key,
    required this.arabic,
    required this.article,
  }) : super(key: key);

  final bool arabic;
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width(context, 0.08)),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            width: width(context, 0.85),
            decoration: BoxDecoration(
              border: Border(
                left: arabic
                    ? BorderSide.none
                    : const BorderSide(
                        color: AppColors.mainColor, width: 5),
                right: !arabic
                    ? BorderSide.none
                    : const BorderSide(
                        color: AppColors.mainColor, width: 5),
              ),
            ),
            child: Text(
              article.title,
              textDirection:
                  arabic ? TextDirection.rtl : TextDirection.ltr,
              style: bigBlackFont()
                  .copyWith(fontWeight: FontWeight.bold, height: 1.3),
            ),
          ),
          SizedBox(
            height: height(context, 0.04),
          ),
          Text(
            article.description,
            textDirection:
                arabic ? TextDirection.rtl : TextDirection.ltr,
            style: mediumBlackFont()
                .copyWith(color: AppColors.grayColor, height: 1.25),
          )
        ],
      ),
    );
  }
}

