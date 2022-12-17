import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helpers/convert_time_stamp.dart';
import 'package:news_app/helpers/navigators.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/ui/custom_widgets/custom_images.dart';
import 'package:news_app/ui/theme/sizes/sizes.dart';
import 'package:news_app/ui/theme/style/colors.dart';
import 'package:news_app/ui/theme/style/font_style.dart';

class NewsDetailsScreen extends StatelessWidget {
  /// news details  , just pass  [Article]

  final Article article;
  const NewsDetailsScreen({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  child: SizedBox(
                    height: height(context, 0.42),
                    width: width(context, 1),
                    child: CustomNetworkImage(imagePath: article.urlToImage),
                  ),
                ),
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
          ],
        )),
      ),
    );
  }
}
