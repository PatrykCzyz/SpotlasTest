import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotlas_test/presentation/misc/size_helper.dart';

class ToolbarWidget extends StatelessWidget {
  const ToolbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: SizeHelper.XXL,
        vertical: SizeHelper.M,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // TODO icons
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/map.svg',
              width: 24,
              height: 24,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/speech_bubble_border.svg',
              width: 24,
              height: 24,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/heart_border.svg',
              width: 24,
              height: 24,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/share.svg',
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
