import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/create_booking_controller.dart';

class CreateBookingView extends GetView<CreateBookingController> {
  const CreateBookingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CreateBookingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CreateBookingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
