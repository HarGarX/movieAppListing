import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFEFEF),
      body: Center(
        child: Text(
          'This is DashBoard view',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
