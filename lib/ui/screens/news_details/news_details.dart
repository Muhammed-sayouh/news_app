import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helpers/convert_time_stamp.dart';
import 'package:news_app/helpers/navigators.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/ui/theme/sizes/sizes.dart';
import 'package:news_app/ui/theme/style/font_style.dart';

import '../../custom_widgets/news_title_content.dart';
import '../../custom_widgets/top_image_news.dart';

class NewsDetailsScreen extends StatelessWidget {
  /// news details  , just pass  [Article]

  final Article article;
  final bool arabic;
  const NewsDetailsScreen(
      {Key? key, required this.article, required this.arabic})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
                arabic ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  TopImageNewsDetails(article: article),
                  IconButton(
                    onPressed: () => Navigators.back(context),
                    icon: const Icon(CupertinoIcons.back, color: Colors.white),
                  ),
                  Positioned(
                    top: height(context, 0.36),
                    left: width(context, 0.05),
                    child: Text(
                      convertTimeToTimeAgo(article.publishedAt),
                      style: mediumBlackFont().copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height(context, 0.02),
              ),
              NewsTitleAndContent(arabic: arabic, article: article),
            ],
          ),
        ),
      ),
    );
  }
}

