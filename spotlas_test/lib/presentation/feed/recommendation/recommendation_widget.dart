import 'package:flutter/material.dart';
import 'package:spotlas_test/presentation/feed/recommendation/caption_widget.dart';
import 'package:spotlas_test/presentation/feed/recommendation/image_widget.dart';
import 'package:spotlas_test/presentation/feed/recommendation/tags_widget.dart';
import 'package:spotlas_test/presentation/feed/recommendation/toolbar_widget.dart';
import 'package:spotlas_test/presentation/misc/size_helper.dart';

class RecommendationWidget extends StatelessWidget {
  const RecommendationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageWidget(),
        ToolbarWidget(),
        CaptionWidget(),
        TagsWidget(),
        // TODO
        Padding(
          padding: EdgeInsets.all(SizeHelper.S).copyWith(
            bottom: SizeHelper.L,
          ),
          child: Text(
            '4 days ago',
            style: TextStyle(
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
