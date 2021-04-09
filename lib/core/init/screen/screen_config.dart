import 'package:flutter/widgets.dart';

/*
SizeConfig file is a tool to adopt to different screen sizes.
It will take the origiginal design values and adopt to current
screen size with multipliers. This will allow to keep the original
design on every screen size including ipad amd tablet.
 */

class Sc {
  static late double _screenWidth;
  static late double _screenHeight;
  static double? _blockSizeHorizontal;
  static double? _blockSizeVertical;

  static double? text;
  static double? image;
  static double? height;
  static double? width;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
    } else {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
    }

    _blockSizeHorizontal = _screenWidth / 100;
    _blockSizeVertical = _screenHeight / 100;

    text = (_blockSizeVertical! + _blockSizeHorizontal!) / 2;
    image = (_blockSizeVertical! + _blockSizeHorizontal!) / 2;
    height = _blockSizeVertical;
    width = _blockSizeHorizontal;
  }
}
