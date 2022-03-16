import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotlas_test/application/feed/feed_bloc.dart';
import 'package:spotlas_test/infrastructure/feed/dtos/photo_resolution.dart';
import 'package:spotlas_test/infrastructure/feed/dtos/recommendation.dart';
import 'package:spotlas_test/presentation/feed/recommendation/animated_heart_widget.dart';
import 'package:spotlas_test/presentation/feed/recommendation/image_overlay/image_overlay_widget.dart';
import 'package:spotlas_test/presentation/misc/size_enum.dart';
import 'package:spotlas_test/presentation/misc/size_helper.dart';
import 'package:spotlas_test/presentation/misc/svg_icons.dart';

class ImageWidget extends StatefulWidget {
  final Recommendation recommendation;

  const ImageWidget(this.recommendation, {Key? key}) : super(key: key);

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );

    _sizeAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 0, end: 120),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 120, end: 0),
        weight: 1,
      ),
    ]).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          1,
          curve: Curves.easeOut,
        ),
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 1.248,
      child: ClipRRect(
        child: Stack(
          children: [
            PageView.builder(
              itemCount: widget.recommendation.photosResolutions.length,
              itemBuilder: (context, index) {
                final photo = widget.recommendation.photosResolutions[index];

                return InkWell(
                  onDoubleTap: () {
                    if (!widget.recommendation.isLiked) {
                      playAnimation();
                    }

                    context
                        .read<FeedBloc>()
                        .add(ToggleLike(widget.recommendation));
                  },
                  child: Image.network(
                    getImageUrl(photo),
                    fit: BoxFit.contain,
                    errorBuilder: ((context, error, stackTrace) => Container(
                          color: Colors.grey[300],
                          child: const Center(
                            child: Text('Photo is not available'),
                          ),
                        )),
                  ),
                );
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ImageOverlayWidget(
                  icon: IconButton(
                    icon: SvgIcons.options(
                      width: 24,
                      height: 24,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  title: widget.recommendation.authorUsername,
                  subtitle: widget.recommendation.authorFullName,
                  imageUrl: widget.recommendation.authorPhotosResolutions.small,
                  imageBorderColor: Theme.of(context).colorScheme.primary,
                  padding: EdgeInsets.only(
                    right: SizeHelper.horizontal(context, SizeEnum.l),
                    left: SizeHelper.horizontal(context, SizeEnum.s),
                    top: SizeHelper.vertical(context, SizeEnum.s),
                  ),
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
                        colors: widget.recommendation.isBookmarked
                            ? gradient
                            : white,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ).createShader(bounds);
                    },
                    child: IconButton(
                      icon: widget.recommendation.isBookmarked
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
                            .add(ToggleBookmark(widget.recommendation));
                      },
                    ),
                  ),
                  title: widget.recommendation.placeName,
                  subtitle:
                      '${widget.recommendation.categoryDisplayName} • ${widget.recommendation.placeLocationName}',
                  imageUrl: widget.recommendation.placeLogoUrl,
                  imageBorderColor: Colors.white,
                  padding: EdgeInsets.only(
                    right: SizeHelper.horizontal(context, SizeEnum.l),
                    left: SizeHelper.horizontal(context, SizeEnum.s),
                    bottom: SizeHelper.vertical(context, SizeEnum.s),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, _) {
                    return ShaderMask(
                      shaderCallback: (Rect bounds) {
                        const gradient = [
                          Color(0xFFFF0080),
                          Color(0xFFFF0040),
                        ];

                        return const LinearGradient(
                          colors: gradient,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ).createShader(bounds);
                      },
                      child: SvgIcons.heart(
                        width: _sizeAnimation.value,
                        height: _sizeAnimation.value,
                        color: Colors.white,
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void playAnimation() {
    _animationController.reset();
    _animationController.forward();
  }

  String getImageUrl(PhotoResolution photo) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < SizeHelper.screenWidthM) {
      return photo.small;
    } else if (screenWidth < SizeHelper.screenWidthL) {
      return photo.medium;
    } else {
      return photo.large;
    }
  }
}
