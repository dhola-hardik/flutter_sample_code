import 'package:dummy_app/res/strings.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class Validate {
  // RegEx pattern for validating email addresses.
  static Pattern emailPattern =
      r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$";
  static RegExp emailRegEx = RegExp(emailPattern);

  // Validates an email address.
  static bool isEmail(String value) {
    if (emailRegEx.hasMatch(value.trim())) {
      return true;
    }
    return false;
  }

  /*
   * Returns an error message if email does not validate.
   */
  static String validateEmail(String value) {
    String email = value.trim();
    if (email.isEmpty) {
      return 'Email is required.';
    }
    if (!isEmail(email)) {
      return 'Enter valid email address.';
    }
    return null;
  }

  static String validateEmailOnly(String value) {
    String email = value.trim();
    if (email.isEmpty) {
      return null;
    }
    if (!isEmail(email)) {
      return 'Enter valid email address.';
    }
    return null;
  }

  static bool isValidEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(value);
  }

  static String isValidEmail2(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.trim().isEmpty || value.length == 0) {
      return 'Please enter your Email';
    } else if (!regex.hasMatch(value)) {
      return 'Please enter valid Email';
    }
  }

  static bool isValidMobile(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.trim().isEmpty || value.length == 0 || !regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  static String isValidatePassword(String value) {
    if (value.trim().isEmpty || value.length == 0) {
      return 'Please enter Password';
    } else if (value.length < 6) {
      return 'Password length should be 6 or more chars.';
    }
    return null;
  }

  static String validateCnfmPassword(String password, String cnfmPass) {
    if (cnfmPass.trim().isEmpty || cnfmPass.length == 0) {
      return strings.cnfm_pwd + strings.is_required;
    } else if (password != cnfmPass) {
      return strings.error_pwd_not_match;
    }
    return null;
  }

  static bool isValideCnfmPassword(String password, String cnfmPass) {
    //
    if (cnfmPass.trim().isEmpty ||
        cnfmPass.length == 0 ||
        password != cnfmPass) {
      return false;
    }
    return true;
  }

  static String requiredField(String value, String message) {
    if (value.trim().isEmpty) {
      return message;
    }
    return null;
  }

  static String requiredField2(String value, String title) {
    if (value.trim().isEmpty) {
      return title + strings.is_required;
    }
    return null;
  }
}
