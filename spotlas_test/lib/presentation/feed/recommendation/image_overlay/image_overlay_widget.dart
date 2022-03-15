import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotlas_test/presentation/feed/recommendation/image_overlay/info_widget.dart';
import 'package:spotlas_test/presentation/misc/size_helper.dart';

class ImageOverlayWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final Color imageBorderColor;
  final EdgeInsets padding;
  final List<BoxShadow>? boxShadows;
  final Widget icon;

  const ImageOverlayWidget({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.imageBorderColor,
    required this.padding,
    required this.icon,
    this.boxShadows,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      padding: padding,
      decoration: BoxDecoration(
        boxShadow: boxShadows,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InfoWidget(
            title: title,
            subtitle: subtitle,
            imageUrl: imageUrl,
            imageBorderColor: imageBorderColor,
          ),
          SizedBox(width: SizeHelper.horizontal(context, SizeEnum.s)),
          icon,
        ],
      ),
    );
  }
}
