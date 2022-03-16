import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:spotlas_test/presentation/misc/size_enum.dart';
import 'package:spotlas_test/presentation/misc/size_helper.dart';

class CaptionWidget extends StatefulWidget {
  final String authorUsername;
  final String description;

  const CaptionWidget({
    Key? key,
    required this.authorUsername,
    required this.description,
  }) : super(key: key);

  @override
  State<CaptionWidget> createState() => _CaptionWidgetState();
}

class _CaptionWidgetState extends State<CaptionWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeHelper.horizontal(context, SizeEnum.s),
      ),
      child: RichText(
        maxLines: _isExpanded ? null : 2,
        overflow: _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
        text: TextSpan(
          text: '${widget.authorUsername} ',
          style: Theme.of(context).textTheme.caption!.copyWith(
                fontWeight: FontWeight.w700,
              ),
          children: [
            TextSpan(
              style: Theme.of(context).textTheme.caption,
              text: _isExpanded
                  ? widget.description
                  : widget.description.replaceAll('\n', ''),
              recognizer: TapGestureRecognizer()
                ..onTap = () => {
                      setState(
                        () {
                          _isExpanded = !_isExpanded;
                        },
                      )
                    },
            ),
          ],
        ),
      ),
    );
  }
}
