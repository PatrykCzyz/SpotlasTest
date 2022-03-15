import 'package:flutter/material.dart';
import 'package:spotlas_test/infrastructure/feed/dtos/recommendation.dart';
import 'package:spotlas_test/presentation/feed/recommendation/caption_widget.dart';
import 'package:spotlas_test/presentation/feed/recommendation/image_widget.dart';
import 'package:spotlas_test/presentation/feed/recommendation/tags_widget.dart';
import 'package:spotlas_test/presentation/feed/recommendation/toolbar_widget.dart';
import 'package:spotlas_test/presentation/misc/size_enum.dart';
import 'package:spotlas_test/presentation/misc/size_helper.dart';

class RecommendationWidget extends StatelessWidget {
  final Recommendation recommendation;

  const RecommendationWidget(this.recommendation, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageWidget(recommendation),
        ToolbarWidget(recommendation),
        CaptionWidget(
          authorUsername: recommendation.authorUsername,
          description: recommendation.description,
        ),
        TagsWidget(recommendation.tags),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeHelper.horizontal(context, SizeEnum.s),
          ).copyWith(
            bottom: SizeHelper.vertical(context, SizeEnum.l),
            top: SizeHelper.vertical(context, SizeEnum.s),
          ),
          child: Text(
            '${DateTime.now().toUtc().difference(recommendation.createdAt.toUtc()).inDays} days ago',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              height: 1.333,
              color: Color(0xFFE8E8F0),
            ),
          ),
        ),
      ],
    );
  }
}
