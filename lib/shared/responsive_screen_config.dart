import 'package:flutter/material.dart';

class ResponsiveScreenConfig {
  late Size _screenSize;
  late double _screenHeight, _screenWidth;
  static double _designHeight = 640, _designWidth = 360;

  void initGetSize(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    _screenHeight = _screenSize.height;
    _screenWidth = _screenSize.width;
  }

  double get height {
    return _screenHeight;
  }

  double get width {
    return _screenWidth;
  }

  double getHeightBasedOnPixels(double height) {
    return (height / _designHeight) * _screenHeight;
  }

  double getWidthBasedOnPixels(double width) {
    return (width / _designWidth) * _screenWidth;
  }
}
