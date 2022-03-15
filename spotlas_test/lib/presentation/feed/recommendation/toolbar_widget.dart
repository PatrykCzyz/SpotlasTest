import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotlas_test/application/feed/feed_bloc.dart';
import 'package:spotlas_test/infrastructure/feed/dtos/recommendation.dart';
import 'package:spotlas_test/presentation/misc/size_enum.dart';
import 'package:spotlas_test/presentation/misc/size_helper.dart';
import 'package:spotlas_test/presentation/misc/svg_icons.dart';

class ToolbarWidget extends StatelessWidget {
  final Recommendation recommendation;

  const ToolbarWidget(
    this.recommendation, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeHelper.horizontal(context, SizeEnum.xxl),
        vertical: SizeHelper.vertical(context, SizeEnum.m),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: SvgIcons.map(
              width: 24,
              height: 24,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgIcons.speechBubbleBorder(
              width: 24,
              height: 24,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          ShaderMask(
            shaderCallback: (bounds) {
              const gradient = [
                Color(0xFFFF0080),
                Color(0xFFFF0040),
              ];

              const black = [Colors.black, Colors.black];

              return LinearGradient(
                colors: recommendation.isLiked ? gradient : black,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(bounds);
            },
            child: IconButton(
              icon: recommendation.isLiked
                  ? SvgIcons.heart(
                      width: 24,
                      height: 24,
                      color: Colors.white,
                    )
                  : SvgIcons.heartBorder(
                      width: 24,
                      height: 24,
                      color: Colors.white,
                    ),
              onPressed: () {
                context.read<FeedBloc>().add(ToggleLike(recommendation));
              },
            ),
          ),
          IconButton(
            icon: SvgIcons.share(
              width: 24,
              height: 24,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
