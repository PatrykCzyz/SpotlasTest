import 'package:flutter/material.dart';
import 'package:spotlas_test/presentation/misc/size_helper.dart';

class InfoWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final Color imageBorderColor;

  const InfoWidget({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.imageBorderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: imageBorderColor,
          // TODO image
          child: CircleAvatar(
            radius: 24.5,
            backgroundImage: NetworkImage(imageUrl),
          ),
        ),
        const SizedBox(width: SizeHelper.S),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: SizeHelper.XXXS),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
      ],
    );
  }
}
