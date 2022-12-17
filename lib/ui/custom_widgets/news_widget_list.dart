import 'package:flutter/material.dart';

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
        itemBuilder: (context, index) => Stack(
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
                        padding:
                            const EdgeInsets.only(right: 3, top: 8),
                        width: width(context, 0.665),
                        height: height(context, 0.075),
                        child: Text(
                            homeProvider.bbcArticles[index].content,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: mediumBlackFont()
                                .copyWith(height: 1.3)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          convertTimeToDaysAndHours(homeProvider
                              .bbcArticles[index].publishedAt),
                          style: smallBlackFont().copyWith(
                              color: AppColors.lightGrayColor),
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
                  imagePath:
                      homeProvider.bbcArticles[index].urlToImage,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
