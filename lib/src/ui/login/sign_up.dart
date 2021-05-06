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

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _pwdController = TextEditingController();
  final _cnfmPwdController = TextEditingController();

  bool _obscureText1 = true;
  bool _obscureText2 = true;

  @override
  void dispose() {
    _nameController?.dispose();
    _emailController?.dispose();
    _pwdController?.dispose();
    _cnfmPwdController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        constants.dismissKeyboard(context);
      },
      child: Scaffold(
        appBar: CustomAppBar(),
        body: _buildBody(),
      ),
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
            WidgetUtil.spaceVertical(30),
            _buildTextField(
              controller: _nameController,
              icon: images.ic_user,
              hintText: strings.enter_yr_name,
              validator: (value) =>
                  Validate.requiredField2(value, strings.name),
            ),
            _buildTextField(
              controller: _emailController,
              icon: images.ic_email,
              hintText: strings.enter_yr_email,
              validator: (value) => Validate.validateEmail(value),
            ),
            _buildTextField(
              controller: _pwdController,
              icon: images.ic_password,
              hintText: strings.enter_yr_pwd,
              isPwd: true,
              obscureText: _obscureText1,
              validator: (value) => Validate.requiredField2(value, strings.pwd),
              onToggle: () {
                setState(() {
                  _obscureText1 = !_obscureText1;
                });
              },
            ),
            _buildTextField(
              controller: _cnfmPwdController,
              icon: images.ic_password,
              hintText: strings.enter_yr_cnfm_pwd,
              isPwd: true,
              obscureText: _obscureText2,
              validator: (value) => Validate.validateCnfmPassword(
                  _pwdController.text, _cnfmPwdController.text),
              onToggle: () {
                setState(() {
                  _obscureText2 = !_obscureText2;
                });
              },
            ),
            WidgetUtil.spaceVertical(30),
            Container(
              width: double.infinity,
              height: 110.h,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    _onSignup();
                  }
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: Text(strings.sign_up.toUpperCase(),
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 48.sp,
                        letterSpacing: 1)),
              ),
            ),
            WidgetUtil.spaceVertical(50),
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
                Text(strings.already_have_an_ac,
                    style: TextStyle(
                        color: appColor.grey, fontWeight: FontWeight.w400)),
                WidgetUtil.spaceHorizontal(50),
                Container(
                  height: 100.h,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: Text(strings.login_now,
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
    bool obscureText = false,
    FormFieldValidator<String> validator,
    VoidCallback onToggle,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.w),
      child: TextFormField(
        controller: controller,
        obscureText: isPwd ? obscureText : false,
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
                      obscureText
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: appColor.white),
                  onPressed: onToggle,
                ),
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

  bool validate() {
    return true;
  }

  void _onSignup() async {
    Get.off(() => HomePage());
  }
}
