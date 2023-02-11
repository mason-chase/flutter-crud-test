import 'package:flutter/material.dart';

class Utils {
  static const double normalRadius = 8;
  static Size appBarSize = const Size.fromHeight(50);

  static const double tinySpace = 2;
  static const double smallSpace = 4;
  static const double mediumSpace = 8;
  static const double semiLargeSpace = 12;
  static const double largeSpace = 16;
  static const double giantSpace = 32;
  static const double maxCrossAxisExtent = 100;
  static const double smallMaxCrossAxisExtent = 80;
  static const double maxWith = 700;
  static const double mediumWith = 500;
  static const tinyVerticalSpace = SizedBox(height: Utils.tinySpace);
  static const smallVerticalSpace = SizedBox(height: Utils.smallSpace);
  static const mediumVerticalSpace = SizedBox(height: Utils.mediumSpace);
  static const largeVerticalSpace = SizedBox(height: Utils.largeSpace);
  static const giantVerticalSpace = SizedBox(height: Utils.giantSpace);

  static const tinyHorizontalSpace = SizedBox(width: Utils.tinySpace);
  static const smallHorizontalSpace = SizedBox(width: Utils.smallSpace);
  static const mediumHorizontalSpace = SizedBox(width: Utils.mediumSpace);
  static const largeHorizontalSpace = SizedBox(width: Utils.largeSpace);
  static const giantHorizontalSpace = SizedBox(width: Utils.giantSpace);

  static const mediumPadding = EdgeInsetsDirectional.all(mediumSpace);
  static const smallPadding = EdgeInsetsDirectional.all(smallSpace);
  static const tinyPadding = EdgeInsetsDirectional.all(tinySpace);
  static const largePadding = EdgeInsetsDirectional.all(largeSpace);
  static const giantPadding = EdgeInsetsDirectional.all(giantSpace);

}
