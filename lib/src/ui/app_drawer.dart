import 'package:dummy_app/res/app_color.dart';
import 'package:dummy_app/res/images.dart';
import 'package:dummy_app/res/strings.dart';
import 'package:dummy_app/utils/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'login/login.dart';

class AppDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  AppDrawer(this.scaffoldKey);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: appColor.black3,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    _buildMenu(
                      image: images.ic_new,
                      name: strings.tx_new,
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    _buildMenu(
                      image: images.ic_reports,
                      name: strings.reports,
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    _buildMenu(
                      image: images.ic_logout,
                      name: strings.log_out,
                      onPressed: () {
                        Get.offAll(() => Login());
                      },
                    ),
                  ],
                ),
              ),
              _buildBottom(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottom() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 50.h),
      child: Text("Version 1.0",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: appColor.white,
              fontSize: 32.sp,
              fontWeight: FontWeight.w400)),
    );
  }

  Widget _buildMenu({String name, String image, VoidCallback onPressed}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: onPressed,
            horizontalTitleGap: 5,
            leading: Image.asset(image, width: 70.w, height: 70.w),
            title: Text(name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 42.sp,
                    fontWeight: FontWeight.w500)),
          ),
          Container(height: 1, color: appColor.grey2),
        ],
      ),
    );

    return InkWell(
      onTap: () {},
      child: Container(
        height: 100.h,
        padding: EdgeInsets.symmetric(horizontal: 50.w),
        child: Row(
          children: [
            Image.asset(image, width: 50.w, height: 50.w),
            WidgetUtil.spaceHorizontal(40),
            Expanded(
                child: Text(name,
                    style: TextStyle(
                        fontSize: 42.sp, fontWeight: FontWeight.w500))),
          ],
        ),
      ),
    );
  }
}
