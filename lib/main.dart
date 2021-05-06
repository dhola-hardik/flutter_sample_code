import 'package:dummy_app/res/app_color.dart';
import 'package:dummy_app/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'src/home_page.dart';
import 'src/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1080, 1920),
      builder: () {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: strings.app_name,
          defaultTransition: Transition.cupertino,
          theme: ThemeData(
            backgroundColor: appColor.black2,
            scaffoldBackgroundColor: appColor.black2,
            appBarTheme: AppBarTheme(
                elevation: 0,
                color: appColor.white,
                brightness: Brightness.dark,
                // textTheme: TextTheme(headline3: TextStyle(color: appColor.primaryColor)),
                iconTheme: IconThemeData(color: appColor.white)),
            textTheme: TextTheme(
                bodyText2: TextStyle(
                    color: appColor.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 42.sp)),
            primaryColor: appColor.primaryColor,
            primaryColorDark: appColor.primaryDarkColor,
            primaryColorLight: appColor.primaryLight,
            accentColor: appColor.accentColor,
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 42.sp))),
            brightness: Brightness.light,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            buttonTheme: ButtonThemeData(buttonColor: appColor.white),
          ),
          home: SplashScreen(),
          // home: HomePage(),
        );
      },
    );
  }
}
