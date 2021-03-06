import 'package:airport_solution/styles/colors.dart';
import 'package:flutter/material.dart';

abstract class BaseStyles {
  static double get borderRadius => 20.0;

  static double get borderWidth => 2.0;

  static double get listFieldHorizontal => 25.0;

  static double get listFieldVertical => 8.0;

  static EdgeInsets get listPadding {
    return EdgeInsets.symmetric(horizontal: listFieldHorizontal, vertical: listFieldVertical);
  }

  static List<BoxShadow> get boxShadow {
    return [
      BoxShadow(
        color: AppColors.lightgrey.withOpacity(.5),
        offset: Offset(1.0, 2.0),
        blurRadius: 2.0,
      )
    ];
  }
}
