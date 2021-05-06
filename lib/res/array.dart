import 'package:dummy_app/models/common_model.dart';
import 'package:flutter/material.dart';

import 'images.dart';

Array array = Array();

class Array {
  static final Array array = Array._i();

  factory Array() {
    return array;
  }

  Array._i();

  List<CommonModel> employeeList = [
    CommonModel(title: "Roked Xumu", sub_title: "Manager", otherValue: "27", image_url: images.url_1),
    CommonModel(title: "Dr Mokesh Backer", sub_title: "Employee", otherValue: "27", image_url: images.url_2),
    CommonModel(title: "Dull Loyed", sub_title: "Saller", otherValue: "27", image_url: images.url_3),
    CommonModel(title: "Joy Joung", sub_title: "Employee", otherValue: "27", image_url: images.url_4),
    CommonModel(title: "Black Oreo", sub_title: "Designer", otherValue: "27", image_url: images.url_5),
    CommonModel(title: "Bhura Taka", sub_title: "Manager", otherValue: "27", image_url: images.url_6),
    CommonModel(title: "Loung Tell", sub_title: "Manager", otherValue: "27", image_url: images.url_7),
  ];
}
