import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotlas_test/presentation/feed/recommendation/image_overlay/info_widget.dart';
import 'package:spotlas_test/presentation/misc/size_helper.dart';

class ImageOverlayWidget extends StatelessWidget {
  // TODO icon asset
  final String imageUrl;
  final String title;
  final String subtitle;
  final String iconAsset;
  final Color imageBorderColor;

  const ImageOverlayWidget({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.iconAsset,
    required this.imageBorderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // TODO real data
        InfoWidget(
          title: title,
          subtitle: subtitle,
          imageUrl: imageUrl,
          imageBorderColor: imageBorderColor,
        ),
        const SizedBox(width: SizeHelper.S),
        IconButton(
          // TODO color
          icon: SvgPicture.asset(
            iconAsset,
            width: 24,
            height: 24,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
