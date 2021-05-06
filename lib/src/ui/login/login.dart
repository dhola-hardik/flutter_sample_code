import 'dart:io';

import 'package:dummy_app/res/app_color.dart';
import 'package:dummy_app/res/images.dart';
import 'package:dummy_app/res/strings.dart';
import 'package:dummy_app/src/home_page.dart';
import 'package:dummy_app/utils/constants.dart';
import 'package:dummy_app/utils/validate.dart';
import 'package:dummy_app/utils/widget_util.dart';
import 'package:dummy_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'sign_up.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _pwdController = TextEditingController();

  bool _isKeepLoggedIn = true;
  bool _obscureText = true;

  @override
  void dispose() {
    _emailController?.dispose();
    _pwdController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        constants.dismissKeyboard(context);
      },
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildAppBar() {
    return CustomAppBar(
      showBackArrow: false,
      showLeadingArrow: false,
      actionsWidget: [
        IconButton(
          icon: Icon(Icons.close, color: appColor.grey),
          onPressed: () {
            exit(0);
          },
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 0.27.sw,
              height: 0.27.sw,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(images.app_icon), fit: BoxFit.fitHeight),
              ),
            ),
            WidgetUtil.spaceVertical(50),
            _buildTextField(
              controller: _emailController,
              icon: images.ic_email,
              hintText: strings.enter_yr_email,
              validator: (value) => Validate.validateEmail(value),
            ),
            WidgetUtil.spaceVertical(50),
            _buildTextField(
              controller: _pwdController,
              icon: images.ic_password,
              hintText: strings.enter_yr_pwd,
              isPwd: true,
              validator: (value) => Validate.requiredField2(value, strings.pwd),
            ),
            WidgetUtil.spaceVertical(20),
            ListTile(
              onTap: () {
                setState(() {
                  _isKeepLoggedIn = !_isKeepLoggedIn;
                });
              },
              dense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              horizontalTitleGap: -5,
              leading: Container(
                width: 50.w,
                height: 50.w,
                child: _isKeepLoggedIn
                    ? Image.asset(images.ic_checked, height: 50.w, width: 50.w)
                    : Icon(Icons.radio_button_unchecked_rounded,
                        color: appColor.white, size: 50.w),
              ),
              title: Text(strings.keep_logged_in,
                  style: TextStyle(color: Colors.white, fontSize: 38.sp)),
            ),
            WidgetUtil.spaceVertical(50),
            Container(
              width: double.infinity,
              height: 110.h,
              child: ElevatedButton(
                onPressed: () {
                  // if (validate()) {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    _onLogin();
                  }
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: Text(strings.login.toUpperCase(),
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 48.sp,
                        letterSpacing: 1)),
              ),
            ),
            WidgetUtil.spaceVertical(30),
            TextButton(
              onPressed: () {},
              child:
                  Text(strings.forget_pass, style: TextStyle(fontSize: 38.sp)),
            ),
            WidgetUtil.spaceVertical(20),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(child: Container(height: 1, color: appColor.grey2)),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Text(strings.or,
                        style: TextStyle(color: appColor.grey2))),
                Expanded(child: Container(height: 1, color: appColor.grey2)),
              ],
            ),
            WidgetUtil.spaceVertical(70),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(strings.dont_hve_ac,
                    style: TextStyle(
                        color: appColor.grey, fontWeight: FontWeight.w400)),
                WidgetUtil.spaceHorizontal(50),
                Container(
                  height: 100.h,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => SignUp());
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: Text(strings.create_new,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 48.sp,
                            letterSpacing: 1)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    TextEditingController controller,
    String icon,
    String hintText,
    bool isPwd = false,
    FormFieldValidator<String> validator,
  }) {
    return Container(
      child: TextFormField(
        controller: controller,
        obscureText: isPwd ? _obscureText : false,
        maxLines: 1,
        keyboardType:
            isPwd ? TextInputType.visiblePassword : TextInputType.emailAddress,
        style: TextStyle(color: appColor.white, fontSize: 44.sp),
        decoration: InputDecoration(
          filled: true,
          fillColor: appColor.black3,
          hintText: hintText,
          hintStyle: TextStyle(color: appColor.white.withOpacity(0.7)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          prefixIconConstraints: BoxConstraints(maxHeight: 70.w),
          prefixIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(icon)),
          suffixIcon: !isPwd
              ? null
              : IconButton(
                  icon: Icon(
                      _obscureText
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: appColor.white),
                  onPressed: _toggle),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(color: appColor.transparent, width: 0)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(color: appColor.transparent, width: 0)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(color: appColor.primaryColor, width: 1.5)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(color: appColor.primaryColor, width: 1.5)),
        ),
        validator: validator,
      ),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool validate() {
    return true;
  }

  void _onLogin() async {
    Get.off(() => HomePage());
  }
}
