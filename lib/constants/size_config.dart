import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../services/debugger_service.dart';

class SizeConfig {
  static late double _screenWidth;

  static double get screenWidth => _screenWidth;
  static late double _screenHeight;
  static double _blockWidth = 0;
  static double _blockHeight = 0;

  late double textMultiplier;
  late double imageSizeMultiplier;
  late double heightMultiplier;
  late double widthMultiplier;
  late bool isPortrait = true;
  late bool isMobilePortrait = false;

  static late _SizeMultiplier sizeMultiplier;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      isPortrait = true;
      if (_screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }

    _blockWidth = _screenWidth / 100;
    _blockHeight = _screenHeight / 100;

    textMultiplier = _blockHeight;
    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;
    DebugLogger.getInstance().logD("SCREEN H:$screenHeight W:$screenWidth");

    DebugLogger.getInstance().logD("MULTIPLIERS H:$heightMultiplier W:$widthMultiplier");

    sizeMultiplier =
        _SizeMultiplier(heightMultiplier, widthMultiplier, imageSizeMultiplier);
  }

  static double get screenHeight => _screenHeight;

  static double get blockWidth => _blockWidth;

  static double get blockHeight => _blockHeight;
}

class _SizeMultiplier {
  _SizeMultiplier(double heightMultiplier, double widthMultiplier,
      double imageSizeMultiplier) {
    unitHeightMultiplier_16 = min(16, heightMultiplier * 2.15);
    unitWidthMultiplier_16 = min(16, widthMultiplier * 3.89);

    unitHeightMultiplier_12 = min(12, heightMultiplier * 1.76);
    unitWidthMultiplier_12 = min(12, widthMultiplier * 2.91);
  }

  late final double unitHeightMultiplier_16;
  late final  double unitWidthMultiplier_16;

  late final double unitHeightMultiplier_12;
  late final double unitWidthMultiplier_12;
}
