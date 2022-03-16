import 'package:flutter/material.dart';
import 'package:spotlas_test/presentation/misc/size_enum.dart';
import 'package:spotlas_test/presentation/misc/size_helper.dart';
import 'package:spotlas_test/presentation/feed/recommendation/widgets/image_overlay/info_widget.dart';

class ImageOverlayWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final Color imageBorderColor;
  final EdgeInsets padding;
  final Widget icon;

  const ImageOverlayWidget({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.imageBorderColor,
    required this.padding,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      padding: padding,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.35),
            blurRadius: 30,
            spreadRadius: 15,
          ),
        ],
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
