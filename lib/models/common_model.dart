import 'dart:convert';

import 'package:flutter/material.dart';

class CommonModel {

  int id;
  String title;
  String sub_title;
  String image_path;
  String image_url;
  var otherValue;
  IconData icon;
  Color color;
  bool showIcon;
  bool selected;

  CommonModel({
    this.id,
    this.title,
    this.sub_title,
    this.image_path,
    this.image_url,
    this.icon,
    this.color,
    this.otherValue,
    this.showIcon = false,
    this.selected = false,
  });

  factory CommonModel.fromRawJson(String str) => CommonModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CommonModel.fromJson(Map<String, dynamic> json) => CommonModel(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    image_path: json["image_path"] == null ? null : json["image_path"],
    image_url: json["image_url"] == null ? null : json["image_url"],
    color: json["color"] == null ? null : json["color"],
    showIcon: json["showIcon"] == null ? null : json["showIcon"],
    selected: json["selected"] == null ? null : json["selected"],
    icon: json["icon"] == null ? null : json["icon"],
    otherValue: json["other_value"] == null ? null : json["other_value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "image_path": image_path == null ? null : image_path,
    "image_url": image_url == null ? null : image_url,
    "color": color == null ? null : color,
    "showIcon": showIcon == null ? null : showIcon,
    "selected": selected == null ? null : selected,
    "icon": icon == null ? null : icon,
    "other_value": otherValue == null ? null : otherValue,
  };
}