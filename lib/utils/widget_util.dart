import 'package:dummy_app/res/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

WidgetUtil widgetUtil = WidgetUtil();

class WidgetUtil {
  static final WidgetUtil _widgetUtil = WidgetUtil._i();

  factory WidgetUtil() {
    return _widgetUtil;
  }

  WidgetUtil._i();

  static Widget spaceHorizontalDef(double width) {
    return SizedBox(width: width);
  }

  static Widget spaceHorizontal(double width) {
    return SizedBox(width: width.w);
  }

  static Widget spaceVerticalDef(double height) {
    return SizedBox(height: height);
  }

  static Widget spaceVertical(double height) {
    return SizedBox(height: height.h);
  }

  static Widget circleContainer(Color color, double size) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(390)),
        color: color,
      ),
    );
  }

  static Widget horizontalLine1() {
    return Container(color: Colors.black.withOpacity(0.2), height: 0.5);
  }

  static Widget horizontalLine2() {
    return Container(height: 1, color: appColor.grey_light);
  }

  static Widget verticalLine1() {
    return Container(color: Colors.black.withOpacity(0.2), width: 0.5);
  }

  static Widget verticalGreyLine1() {
    return Container(color: Colors.grey, width: 0.5);
  }

  static Widget hLightGreyLineBySize(double height) {
    return Container(color: appColor.notWhite, height: height);
  }
}
