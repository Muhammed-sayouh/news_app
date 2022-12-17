import 'package:flutter/material.dart';
import 'package:news_app/helpers/constants.dart';
import 'package:news_app/ui/custom_widgets/custom_slider.dart';
import 'package:news_app/ui/theme/sizes/sizes.dart';
import 'package:news_app/ui/theme/style/font_style.dart';
import 'package:news_app/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

import '../../custom_widgets/error_widgt.dart';
import '../../custom_widgets/news_widget_list.dart';
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
          child: homeProvider.errorEgyptNews
              ? const CustomErrorWidget()
              : Column(
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
                        style: bigBlackFont()
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const BigPadding(),
                    NewsWidgetList(homeProvider: homeProvider)
                  ],
                ),
        ),
      ),
    );
  }
}
