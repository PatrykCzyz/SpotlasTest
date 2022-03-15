import 'package:flutter/material.dart';
import 'package:spotlas_test/presentation/misc/size_enum.dart';
import 'package:spotlas_test/presentation/misc/size_helper.dart';

class CaptionWidget extends StatelessWidget {
  final String authorUsername;
  final String description;
  const CaptionWidget({
    Key? key,
    required this.authorUsername,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeHelper.horizontal(context, SizeEnum.s),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // TODO implement more less  
          // https://stackoverflow.com/questions/49572747/flutter-how-to-hide-or-show-more-text-within-certain-length
          
          return RichText(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              // TODO czy te odstepy tak?
              text: '$authorUsername ',
              style: Theme.of(context).textTheme.caption!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
              children: [
                TextSpan(
                  style: Theme.of(context).textTheme.caption,
                  text: description,
                ),
                TextSpan(
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: const Color(0xFFC8C8D4)),
                  text: ' more...',
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
