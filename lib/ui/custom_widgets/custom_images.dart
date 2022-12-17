import 'package:flutter/cupertino.dart';
import 'package:news_app/ui/theme/style/colors.dart';

import '../../helpers/constants.dart';

class CustomAssetImage extends StatelessWidget {
  final double? height;
  final double? width;
  final String imagePath;
  final bool isScaleDown;
  const CustomAssetImage(
      {Key? key, this.height, this.width, required this.imagePath,  this.isScaleDown = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mainColor,
      height: height,
      width: width,
      child: Image.asset(
        imagePath,
        // fit:isScaleDown?BoxFit.scaleDown :BoxFit.fill,
      ),
    );
  }
}

class CustomNetworkImage extends StatelessWidget {
  final double? height;
  final double? width;
  final String imagePath;
  const CustomNetworkImage(
      {Key? key, this.height, this.width, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: FadeInImage.assetNetwork(
        image: imagePath,
        fit: BoxFit.cover,
        placeholder: Constants.spinnerLoader,
        
      
        imageErrorBuilder: (BuildContext context, x, u) =>
            const CustomAssetImage(imagePath: Constants.smallBlackLogo , isScaleDown: true,),
      ),
    );
  }
}
