import 'package:flutter/material.dart';
import 'package:news_app/helpers/constants.dart';
import 'package:news_app/helpers/convert_time_stamp.dart';
import 'package:news_app/ui/custom_widgets/custom_images.dart';
import 'package:news_app/ui/custom_widgets/custom_slider.dart';
import 'package:news_app/ui/theme/sizes/sizes.dart';
import 'package:news_app/ui/theme/style/colors.dart';
import 'package:news_app/ui/theme/style/font_style.dart';
import 'package:news_app/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

import '../../custom_widgets/top_widget_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<HomeViewModel>(context, listen: false).fetchEgyptNews();
    Provider.of<HomeViewModel>(context, listen: false).fetchBBCNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopWidgetHomeScreen(),
              const BigPadding(),
              SizedBox(
                height: height(context, 0.28),
                child: ImageSlider(
                  articles: homeProvider.egyptArticles,
                ),
              ),
              SizedBox(
                height: height(context, 0.02),
              ),
              Padding(
                padding: commonPaddingHorizental(context),
                child: Text(
                  Constants.latestNews,
                  style: bigBlackFont().copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const BigPadding(),
              Padding(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
