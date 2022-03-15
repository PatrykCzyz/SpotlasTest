import 'package:flutter/material.dart';
import 'package:spotlas_test/presentation/misc/size_enum.dart';

class SizeHelper {
  static double horizontal(
    BuildContext context,
    SizeEnum size,
  ) {
    final width = MediaQuery.of(context).size.width;

    if (width <= _screenWidthS) {
      return _sizeS[size]!.toDouble();
    } else if (width >= _screenWidthL) {
      return _sizeL[size]!.toDouble();
    } else if (width == _screenWidthM) {
      return _sizeM[size]!.toDouble();
    } else if (width > _screenWidthS && width < _screenWidthM) {
      const rangeDifference = _screenWidthM - _screenWidthS;
      final screenDifference = width - _screenWidthS;

      final scale = screenDifference / rangeDifference;

      final sizeDifference = _sizeM[size]! - _sizeS[size]!;

      return _sizeS[size]! + (sizeDifference * scale);
    } else if (width > _screenWidthM && width < _screenWidthL) {
      const rangeDifference = _screenWidthL - _screenWidthM;
      final screenDifference = width - _screenWidthM;

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

    if (height <= _screenHeightS) {
      return _sizeS[size]!.toDouble();
    } else if (height >= _screenHeightL) {
      return _sizeL[size]!.toDouble();
    } else if (height == _screenHeightM) {
      return _sizeM[size]!.toDouble();
    } else if (height > _screenHeightS && height < _screenHeightM) {
      const rangeDifference = _screenHeightM - _screenHeightS;
      final screenDifference = height - _screenHeightS;

      final scale = screenDifference / rangeDifference;

      final sizeDifference = _sizeM[size]! - _sizeS[size]!;

      return _sizeS[size]! + (sizeDifference * scale);
    } else if (height > _screenHeightM && height < _screenHeightL) {
      const rangeDifference = _screenHeightL - _screenHeightM;
      final screenDifference = height - _screenHeightM;

      final scale = screenDifference / rangeDifference;

      final sizeDifference = _sizeL[size]! - _sizeM[size]!;

      return _sizeM[size]! + (sizeDifference * scale);
    }

    throw Exception();
  }

  static const _screenWidthS = 320;
  static const _screenWidthM = 375;
  static const _screenWidthL = 428;

  static const _screenHeightS = 667;
  static const _screenHeightM = 812;
  static const _screenHeightL = 926;

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
