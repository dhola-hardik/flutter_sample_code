import 'package:dummy_app/res/images.dart';
import 'package:dummy_app/res/strings.dart';
import 'package:dummy_app/utils/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'home_page.dart';
import 'ui/login/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 2000), () {
      Get.off(() => Login());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 250.w,
            backgroundImage: ExactAssetImage(images.app_icon),
          ),
          WidgetUtil.spaceVertical(50),
          Text(strings.dummy_app,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 84.sp)),
        ],
      ),
    );
  }
}
