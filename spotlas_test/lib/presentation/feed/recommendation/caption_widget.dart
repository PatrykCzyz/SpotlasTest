import 'package:flutter/material.dart';
import 'package:spotlas_test/presentation/misc/size_helper.dart';

class CaptionWidget extends StatelessWidget {
  const CaptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: SizeHelper.S,
      ),
      child: RichText(
        text: TextSpan(
          text: 'nataliestevens ',
          style: Theme.of(context).textTheme.caption!.copyWith(
                fontWeight: FontWeight.w700,
              ),
          children: [
            TextSpan(
              style: Theme.of(context).textTheme.caption,
              text:
                  'The best peruvian food in London. You have to try to Peruvian burger and almon tacos',
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
      ),
    );
  }
}
