import 'package:flutter/material.dart';
import 'package:spotlas_test/infrastructure/feed/dtos/tag.dart';
import 'package:spotlas_test/presentation/misc/size_enum.dart';
import 'package:spotlas_test/presentation/misc/size_helper.dart';

class TagsWidget extends StatelessWidget {
  final List<Tag> tags;

  const TagsWidget(this.tags, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (tags.isEmpty) {
      return Container();
    }

    return Container(
      padding: EdgeInsets.only(
        top: SizeHelper.vertical(context, SizeEnum.xs),
        left: SizeHelper.horizontal(context, SizeEnum.s),
      ),
      height: 40,
      child: ListView.separated(
        clipBehavior: Clip.none,
        itemCount: tags.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          final tag = tags[index];

          return TagWidget(text: tag.name);
        },
        separatorBuilder: (_, index) {
          return SizedBox(
            width: SizeHelper.horizontal(context, SizeEnum.xxs),
          );
        },
      ),
    );
  }
}

class TagWidget extends StatelessWidget {
  final String text;

  const TagWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      child: Container(
        height: 32,
        padding: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 8,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            height: 1.333,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
