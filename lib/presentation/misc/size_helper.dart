import 'package:flutter/material.dart';
import 'package:spotlas_test/presentation/misc/size_enum.dart';

class SizeHelper {
  static double horizontal(
    BuildContext context,
    SizeEnum size,
  ) {
    final width = MediaQuery.of(context).size.width;

    if (width <= screenWidthS) {
      return _sizeS[size]!.toDouble();
    } else if (width >= screenWidthL) {
      return _sizeL[size]!.toDouble();
    } else if (width == screenWidthM) {
      return _sizeM[size]!.toDouble();
    } else if (width > screenWidthS && width < screenWidthM) {
      const rangeDifference = screenWidthM - screenWidthS;
      final screenDifference = width - screenWidthS;

      final scale = screenDifference / rangeDifference;

      final sizeDifference = _sizeM[size]! - _sizeS[size]!;

      return _sizeS[size]! + (sizeDifference * scale);
    } else if (width > screenWidthM && width < screenWidthL) {
      const rangeDifference = screenWidthL - screenWidthM;
      final screenDifference = width - screenWidthM;

      final scale = screenDifference / rangeDifference;

      final sizeDifference = _sizeL[size]! - _sizeM[size]!;

      return _sizeM[size]! + (sizeDifference * scale);
    }

    throw Exception();
  }

  static double vertical(
    BuildContext context,
    SizeEnum size,
  ) {
    final height = MediaQuery.of(context).size.height;

    if (height <= screenHeightS) {
      return _sizeS[size]!.toDouble();
    } else if (height >= screenHeightL) {
      return _sizeL[size]!.toDouble();
    } else if (height == screenHeightM) {
      return _sizeM[size]!.toDouble();
    } else if (height > screenHeightS && height < screenHeightM) {
      const rangeDifference = screenHeightM - screenHeightS;
      final screenDifference = height - screenHeightS;

      final scale = screenDifference / rangeDifference;

      final sizeDifference = _sizeM[size]! - _sizeS[size]!;

      return _sizeS[size]! + (sizeDifference * scale);
    } else if (height > screenHeightM && height < screenHeightL) {
      const rangeDifference = screenHeightL - screenHeightM;
      final screenDifference = height - screenHeightM;

      final scale = screenDifference / rangeDifference;

      final sizeDifference = _sizeL[size]! - _sizeM[size]!;

      return _sizeM[size]! + (sizeDifference * scale);
    }

    throw Exception();
  }

  static const screenWidthS = 320;
  static const screenWidthM = 375;
  static const screenWidthL = 428;

  static const screenHeightS = 667;
  static const screenHeightM = 812;
  static const screenHeightL = 926;

  static const _sizeS = <SizeEnum, int>{
    SizeEnum.xxxxs: 1,
    SizeEnum.xxxs: 1,
    SizeEnum.xxs: 2,
    SizeEnum.xs: 4,
    SizeEnum.s: 8,
    SizeEnum.m: 12,
    SizeEnum.l: 16,
    SizeEnum.xl: 24,
    SizeEnum.xxl: 32,
    SizeEnum.xxxl: 48,
    SizeEnum.xxxxl: 96,
  };

  static const _sizeM = <SizeEnum, int>{
    SizeEnum.xxxxs: 1,
    SizeEnum.xxxs: 2,
    SizeEnum.xxs: 4,
    SizeEnum.xs: 8,
    SizeEnum.s: 12,
    SizeEnum.m: 16,
    SizeEnum.l: 24,
    SizeEnum.xl: 32,
    SizeEnum.xxl: 48,
    SizeEnum.xxxl: 64,
    SizeEnum.xxxxl: 128,
  };

  static const _sizeL = <SizeEnum, int>{
    SizeEnum.xxxxs: 1,
    SizeEnum.xxxs: 3,
    SizeEnum.xxs: 6,
    SizeEnum.xs: 12,
    SizeEnum.s: 16,
    SizeEnum.m: 24,
    SizeEnum.l: 32,
    SizeEnum.xl: 40,
    SizeEnum.xxl: 56,
    SizeEnum.xxxl: 80,
    SizeEnum.xxxxl: 160,
  };
}
