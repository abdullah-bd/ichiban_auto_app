import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ichiban_auto/theme/dashboard_appbar.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbarWidgetDashboard(controller),
      body: const Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
