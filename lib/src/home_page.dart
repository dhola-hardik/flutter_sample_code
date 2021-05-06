import 'package:dummy_app/res/app_color.dart';
import 'package:dummy_app/res/images.dart';
import 'package:dummy_app/res/strings.dart';
import 'package:dummy_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ui/app_drawer.dart';
import 'ui/home/home.dart';
import 'ui/setting/setting.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  int _currentIndex = 0;
  List _list = [Home(), Setting()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBody: true,
      appBar: _buildAppBar(),
      drawer: AppDrawer(_scaffoldKey),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildAppBar() {
    return CustomAppBar(
      elevation: 0,
      showBackArrow: false,
      showLeadingArrow: false,
      title: strings.dummy_project,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          if (!_scaffoldKey.currentState.isDrawerOpen) {
            _scaffoldKey.currentState.openDrawer();
          }
        },
      ),
    );
  }

  Widget _buildBody() {
    return _list[_currentIndex];
  }

  Widget _buildBottomBar() {
    return Container(
      height: 150.h,
      child: BottomNavigationBar(
        onTap: (index) {
          _currentIndex = index;
          setState(() {});
        },
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: appColor.black3,
        unselectedItemColor: appColor.grey,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: strings.home),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: strings.setting),
        ],
      ),
    );
  }
}
