import 'package:flutter/material.dart';
import 'package:news_app/helpers/navigators.dart';
import 'package:news_app/ui/screens/news_details/news_details.dart';

import '../../helpers/convert_time_stamp.dart';
import '../../view_model/home_view_model.dart';
import '../theme/sizes/sizes.dart';
import '../theme/style/colors.dart';
import '../theme/style/font_style.dart';
import 'custom_images.dart';

class NewsWidgetList extends StatelessWidget {
  /// content BBC new just pass your provider class ===> [homeProvider]

  const NewsWidgetList({
    Key? key,
    required this.homeProvider,
  }) : super(key: key);

  final HomeViewModel homeProvider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: width(context, 0.04)),
      child: ListView.builder(
        itemCount: homeProvider.bbcArticles.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => InkWell(
          onTap: () => Navigators.getTo(
              context,
              NewsDetailsScreen(
                  article: homeProvider.bbcArticles[index], arabic: false)),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: width(context, 1),
                  height: height(context, 0.12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: width(context, 0.27),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 3, top: 8),
                          width: width(context, 0.665),
                          height: height(context, 0.075),
                          child: Text(homeProvider.bbcArticles[index].title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: mediumBlackFont().copyWith(height: 1.3)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                convertTimeToTimeAgo(homeProvider
                                    .bbcArticles[index].publishedAt),
                                style: smallBlackFont()
                                    .copyWith(color: AppColors.lightGrayColor),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 15),
                                child: Icon(
                                  Icons.bookmark_sharp,
                                  color: AppColors.mainColor,
                                  size: 15,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: width(context, 0.23),
                  height: width(context, 0.23),
                  child: CustomNetworkImage(
                    imagePath: homeProvider.bbcArticles[index].urlToImage,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
