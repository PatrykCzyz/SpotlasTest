import 'package:flutter/material.dart';
import 'package:spotlas_test/presentation/misc/size_helper.dart';

class TagsWidget extends StatelessWidget {
  const TagsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: SizeHelper.XS,
        left: SizeHelper.S,
      ),
      // TODO tags
      child: Row(
        children: [
          TagWidget(text: 'Outdoors'),
          SizedBox(
            width: SizeHelper.XXS,
          ),
          TagWidget(text: 'Cheap'),
          SizedBox(
            width: SizeHelper.XXS,
          ),
          TagWidget(text: 'Live Music'),
          SizedBox(
            width: SizeHelper.XXS,
          ),
          TagWidget(text: 'Fancy'),
          SizedBox(
            width: SizeHelper.XXS,
          )
        ],
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
      borderRadius: BorderRadius.all(Radius.circular(4)),
      child: Container(
        height: 32,
        padding: EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 8,
        ),
        child: Text(text,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              height: 1.333,
              color: Colors.black,
            )),
      ),
    );
  }
}
