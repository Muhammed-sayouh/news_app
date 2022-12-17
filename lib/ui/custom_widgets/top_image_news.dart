import 'package:flutter/material.dart';

import '../../model/news_model.dart';
import '../theme/sizes/sizes.dart';
import 'custom_images.dart';

class TopImageNewsDetails extends StatelessWidget {
  ///content article image , just passs [article]
  const TopImageNewsDetails({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
      ),
      child: SizedBox(
        height: height(context, 0.42),
        width: width(context, 1),
        child: CustomNetworkImage(imagePath: article.urlToImage),
      ),
    );
  }
}
