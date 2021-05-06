import 'package:dummy_app/models/common_model.dart';
import 'package:dummy_app/res/app_color.dart';
import 'package:dummy_app/res/strings.dart';
import 'package:dummy_app/utils/widget_util.dart';
import 'package:dummy_app/widgets/custom_appbar.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EmployeeDetails extends StatefulWidget {
  final CommonModel data;

  EmployeeDetails({this.data});

  @override
  _EmployeeDetailsState createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends State<EmployeeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: strings.employee_details),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 40.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ExtendedImage.network(
            widget.data.image_url,
            height: 0.6.sw,
            cache: true,
            // fit: BoxFit.cover,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
          ),
          WidgetUtil.spaceVertical(70),
          Text(widget.data.title,
              style: TextStyle(color: appColor.greyLight, fontSize: 58.sp)),
          WidgetUtil.spaceVertical(15),
          Row(
            children: [
              Text(strings.age_,
                  style: TextStyle(
                      color: appColor.greyLight,
                      fontWeight: FontWeight.w500,
                      fontSize: 38.sp)),
              WidgetUtil.spaceHorizontal(20),
              Expanded(
                  child: Text(widget.data.otherValue + strings.year_old.toLowerCase(),
                      style: TextStyle(
                          color: appColor.greyLight,
                          fontWeight: FontWeight.w400,
                          fontSize: 38.sp))),
            ],
          ),
          WidgetUtil.spaceVertical(20),
          Text(widget.data.sub_title,
              style: TextStyle(color: appColor.green2, fontSize: 36.sp)),
          WidgetUtil.spaceVertical(30),
          Text(strings.about_me_,
              style: TextStyle(color: appColor.greyLight, fontSize: 56.sp)),
          WidgetUtil.spaceVertical(20),
          Text(strings.lorem_ipsum,
              style: TextStyle(
                  color: appColor.greyLight,
                  fontSize: 38.sp,
                  fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}
