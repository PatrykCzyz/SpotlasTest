import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcons {
  static Widget map({
    double? width,
    double? height,
    Color? color,
  }) =>
      SvgPicture.asset(
        'assets/icons/map.svg',
        width: width,
        height: height,
        color: color,
      );

  static Widget speechBubbleBorder({
    double? width,
    double? height,
    Color? color,
  }) =>
      SvgPicture.asset(
        'assets/icons/speech_bubble_border.svg',
        width: width,
        height: height,
        color: color,
      );

  static Widget heart({
    double? width,
    double? height,
    Color? color,
  }) =>
      SvgPicture.asset(
        'assets/icons/heart.svg',
        width: width,
        height: height,
        color: color,
      );

  static Widget heartBorder({
    double? width,
    double? height,
    Color? color,
  }) =>
      SvgPicture.asset(
        'assets/icons/heart_border.svg',
        width: width,
        height: height,
        color: color,
      );

  static Widget share({
    double? width,
    double? height,
    Color? color,
  }) =>
      SvgPicture.asset(
        'assets/icons/share.svg',
        width: width,
        height: height,
        color: color,
      );

  static Widget options({
    double? width,
    double? height,
    Color? color,
  }) =>
      SvgPicture.asset(
        'assets/icons/options.svg',
        width: width,
        height: height,
        color: color,
      );

  static Widget star({
    double? width,
    double? height,
    Color? color,
  }) =>
      SvgPicture.asset(
        'assets/icons/star.svg',
        width: width,
        height: height,
        color: color,
      );

  static Widget starBorder({
    double? width,
    double? height,
    Color? color,
  }) =>
      SvgPicture.asset(
        'assets/icons/star_border.svg',
        width: width,
        height: height,
        color: color,
      );
}
