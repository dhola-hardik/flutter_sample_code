import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'log_util.dart';

Constants constants = Constants();

final title = "Constants";

class Constants {
  static final Constants _constants = Constants._i();

  factory Constants() {
    return _constants;
  }

  Constants._i();

  String capitalizeFirstLetter(String s) {
    return (s ?? '').length < 1
        ? ''
        : s[0].toUpperCase() + s.substring(1).toLowerCase();
  }

  String capitalizeFirstLetter2(String string) {
    if (string == null) {
      throw ArgumentError("string: $string");
    }

    if (string.isEmpty) {
      return string;
    }

    return string[0].toUpperCase() + string.substring(1);
  }

  void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  void dismissKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void dismissSnakbar() {
    // Scaffold.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(Get.context).hideCurrentSnackBar();
    // scaffoldKey.currentState.removeCurrentSnackBar();
  }

  void showInSnackBar(String value, {bool isFloat = false, Color bgColor}) {
    //

    ScaffoldMessenger.of(Get.context).hideCurrentSnackBar();

    if (isFloat) {
      ScaffoldMessenger.of(Get.context).showSnackBar(
        SnackBar(
          duration: Duration(milliseconds: 2000),
          behavior: SnackBarBehavior.floating,
          backgroundColor: bgColor,
          content: Text(value, style: TextStyle(color: Colors.white)),
        ),
      );
    } else {
      ScaffoldMessenger.of(Get.context).showSnackBar(
        SnackBar(
          duration: Duration(milliseconds: 2000),
          backgroundColor: bgColor,
          content: Text(value),
        ),
      );
    }
  }

  void showSnackBar(String value, {bool isFloat = false}) {
    //

    if (isFloat) {
      ScaffoldMessenger.of(Get.context).showSnackBar(
        SnackBar(
          duration: Duration(milliseconds: 2000),
          behavior: SnackBarBehavior.floating,
          //backgroundColor: Colors.red,
          content: Text(value, style: TextStyle(color: Colors.white)),
        ),
      );
    } else {
      ScaffoldMessenger.of(Get.context).showSnackBar(
        SnackBar(
          duration: Duration(milliseconds: 2000),
          content: Text(value),
        ),
      );
    }
  }

  launchURL2(String url) async {
    // js.context.callMethod('open', [url]);
    // html.window.open(url, 'new tab');
  }
}
