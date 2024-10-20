import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegistrationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RegistrationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
