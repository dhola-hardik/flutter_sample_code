import 'package:dummy_app/res/array.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/employee_details.dart';
import 'widgets/item_employee.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: array.employeeList.length,
      itemBuilder: (context, index) {
        final data = array.employeeList[index];
        return ItemEmployee(
          data: data,
          onPressed: () {
            Get.to(() => EmployeeDetails(data: data));
          },
        );
      },
    );
  }
}
