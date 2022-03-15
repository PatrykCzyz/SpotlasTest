import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotlas_test/application/feed/feed_bloc.dart';
import 'package:spotlas_test/infrastructure/feed/dtos/recommendation.dart';
import 'package:spotlas_test/presentation/feed/recommendation/image_overlay/image_overlay_widget.dart';
import 'package:spotlas_test/presentation/misc/size_helper.dart';
import 'package:spotlas_test/presentation/misc/svg_icons.dart';

class ImageWidget extends StatelessWidget {
  final Recommendation recommendation;

  const ImageWidget(this.recommendation, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // TODO czy na pewno tak?
      width: 375,
      height: 468,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: recommendation.photosResolutions.length,
            itemBuilder: (context, index) {
              final photo = recommendation.photosResolutions[index];

              return Image.network(
                photo.medium,
                errorBuilder: ((context, error, stackTrace) => Container(
                      color: Colors.grey[300],
                      child: const Center(
                        child: Text('Photo is not available'),
                      ),
                    )),
              );
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // tODO Icons  and images in pref res
              ImageOverlayWidget(
                icon: IconButton(
                  // TODO color
                  icon: SvgIcons.options(
                    width: 24,
                    height: 24,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                title: recommendation.authorUsername,
                subtitle: recommendation.authorFullName,
                imageUrl: recommendation.authorPhotosResolutions.medium,
                imageBorderColor: Theme.of(context).colorScheme.primary,
                padding: EdgeInsets.only(
                  right: SizeHelper.horizontal(context, SizeEnum.l),
                  left: SizeHelper.horizontal(context, SizeEnum.s),
                  top: SizeHelper.vertical(context, SizeEnum.s),
                ),
                // TODO shadow
                // boxShadows: [
                //   BoxShadow(
                //     blurStyle: BlurStyle.inner,
                //     color: Colors.black,
                //     blurRadius: 30,
                //   ),
                // ],
              ),
              ImageOverlayWidget(
                icon: ShaderMask(
                  shaderCallback: (bounds) {
                    const gradient = [
                      Color(0xFFFFE000),
                      Color(0xFFFFB000),
                    ];

                    const white = [Colors.white, Colors.white];

                    return LinearGradient(
                      colors: recommendation.isBookmarked ? gradient : white,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ).createShader(bounds);
                  },
                  child: IconButton(
                    icon: recommendation.isBookmarked
                        ? SvgIcons.star(
                            width: 24,
                            height: 24,
                            color: Colors.white,
                          )
                        : SvgIcons.starBorder(
                            width: 24,
                            height: 24,
                            color: Colors.white,
                          ),
                    onPressed: () {
                      context
                          .read<FeedBloc>()
                          .add(ToggleBookmark(recommendation));
                    },
                  ),
                ),
                title: recommendation.placeLocationName,
                subtitle: recommendation.placeLocationNameO,
                // TODO place logo
                imageUrl: recommendation.placeLogoUrl,
                imageBorderColor: Colors.white,
                padding: EdgeInsets.only(
                  right: SizeHelper.horizontal(context, SizeEnum.l),
                  left: SizeHelper.horizontal(context, SizeEnum.s),
                  bottom: SizeHelper.vertical(context, SizeEnum.s),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
