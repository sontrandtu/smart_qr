// ignore_for_file: constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';

class Responsive {
  /// Get size by dimension screen
  ///
  /// /// Parameter [int] size
  /// Return [double]
  static double getSize(num size) {
    var device = MediaQueryData.fromView(
            WidgetsBinding.instance.platformDispatcher.views.single)
        .size;

    final deviceWidth = device.width;
    final deviceHeight = device.height;

    const baseWidth = 305;
    const BASE_HEIGHT = 589;

    final widthPercent = deviceWidth / baseWidth;
    final heightPercent = deviceHeight / BASE_HEIGHT;

    final scale = min(widthPercent, heightPercent);

    return size * scale;
  }

  static double getWidthSize(double size) {
    var device = MediaQueryData.fromView(
            WidgetsBinding.instance.platformDispatcher.views.single)
        .size;

    final deviceWidth = device.width;

    const baseWidth = 305;

    final widthPercent = deviceWidth / baseWidth;
    return size * widthPercent;
  }

  static double getHeightSize(double size) {
    var device = MediaQueryData.fromView(
            WidgetsBinding.instance.platformDispatcher.views.single)
        .size;
    final deviceHeight = device.height;

    const BASE_HEIGHT = 589;

    final heightPercent = deviceHeight / BASE_HEIGHT;
    return size * heightPercent;
  }
}
