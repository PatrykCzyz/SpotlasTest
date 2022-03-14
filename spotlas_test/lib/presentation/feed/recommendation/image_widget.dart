import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotlas_test/presentation/feed/recommendation/image_overlay/image_overlay_widget.dart';
import 'package:spotlas_test/presentation/feed/recommendation/image_overlay/info_widget.dart';
import 'package:spotlas_test/presentation/misc/size_helper.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // TODO czy na pewno tak?
      width: 375,
      height: 468,
      padding: const EdgeInsets.all(
        SizeHelper.S,
      ).copyWith(
        right: SizeHelper.L,
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/testimg.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // tODO icons and data
          ImageOverlayWidget(
            iconAsset: 'assets/icons/options.svg',
            title: 'nataliestevens',
            subtitle: 'Natalie Stevens',
            imageUrl: 'https://d3qsefuprrv1m2.cloudfront.net/resize/687/user_avatar/0d04960d-6f9a-4071-975e-7af4fc91ec91.jpeg',
            imageBorderColor: Theme.of(context).colorScheme.primary,
          ),
          const ImageOverlayWidget(
            iconAsset: 'assets/icons/star_border.svg',
            title: 'Pachamama',
            subtitle: 'Marylebone - London',
            imageUrl: 'https://d38tlmxhfjgwd9.cloudfront.net/resize/687/user_avatar/38b39083-d864-49ff-ab17-8d1c98926df7.jpeg',
            imageBorderColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
