import 'package:flutter/material.dart';
import 'package:spotlas_test/presentation/misc/size_enum.dart';
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
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: imageBorderColor,
            // TODO handle errors
            child: CircleAvatar(
              radius: 24.5,
              // backgroundImage: NetworkImage(imageUrl),
              // child: Image.network(
              //   imageUrl,
              //   errorBuilder: ((context, error, stackTrace) {
              //     return Container(
              //       color: Colors.red,
              //     );
              //   }),
              // ),
            ),
          ),
          SizedBox(width: SizeHelper.horizontal(context, SizeEnum.s)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(height: SizeHelper.vertical(context, SizeEnum.xxxs)),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
