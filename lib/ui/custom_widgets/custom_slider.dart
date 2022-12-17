import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/ui/custom_widgets/custom_images.dart';
import 'package:news_app/ui/theme/sizes/sizes.dart';
import 'package:news_app/ui/theme/style/colors.dart';

class ImageSlider extends StatefulWidget {
/// EGYPT news in image slider , just pass list of [articles] 

  final List<Article> articles;
  const ImageSlider({super.key, required this.articles});
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<ImageSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: CarouselSlider(
          items: widget.articles
              .map((item) => Container(
                    margin: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        child: Stack(
                          children: <Widget>[
                            SizedBox(
                              width: width(context, 0.8),
                              height: height(context, 0.26),
                              child: CustomNetworkImage(
                                  imagePath: item.urlToImage),
                            ),
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 0.0,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                child: Text(
                                  item.title.toString(),
                                  textDirection: TextDirection.rtl,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    height: 1.2,
                                    color: Colors.white,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ))
              .toList(),
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.articles.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 9.0,
              height: 9.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: _current == entry.key
                          ? AppColors.mainColor
                          : Colors.white),
                  shape: BoxShape.circle,
                  color: (_current == entry.key
                      ? Colors.white
                      : AppColors.mainColor)),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}
