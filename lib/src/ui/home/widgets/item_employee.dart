import 'package:dummy_app/models/common_model.dart';
import 'package:dummy_app/res/app_color.dart';
import 'package:dummy_app/res/strings.dart';
import 'package:dummy_app/utils/widget_util.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemEmployee extends StatelessWidget {
  final CommonModel data;
  final VoidCallback onPressed;

  ItemEmployee({this.data, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: InkWell(
        onTap: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 40.w),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: CircleAvatar(
                      radius: 100.w,
                      backgroundColor: appColor.transparent,
                      child: ExtendedImage.network(
                        data.image_url,
                        width: 250.w,
                        height: 250.w,
                        cache: true,
                        shape: BoxShape.circle,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  WidgetUtil.spaceHorizontal(30),
                  Expanded(
                    child: Column(
                      children: [
                        _buildNameValue(strings.name_, data.title),
                        _buildNameValue(strings.position_, data.sub_title, appColor.green2),
                        _buildNameValue(strings.age_, data.otherValue +  strings.year_old),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios_rounded, color: appColor.grey),
                ],
              ),
            ),
            Container(height: 1, color: appColor.grey2),
          ],
        ),
      ),
    );
  }

  Widget _buildNameValue(String name, String value, [Color textColor]) {
    return Container(
      child: Row(
        children: [
          Text(name,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 36.sp)),
          WidgetUtil.spaceHorizontal(20),
          Expanded(
              child: Text(value,
                  style: TextStyle(
                      color: textColor ?? appColor.greyLight,
                      fontWeight: FontWeight.w400,
                      fontSize: 34.sp))),
        ],
      ),
    );
  }
}
