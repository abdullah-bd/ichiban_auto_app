import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../theme/Colors.dart';
import '../../../../theme/image_assets.dart';
import '../../../../theme/text_widgets.dart';
import '../../../../utils/utils.dart';
import '../controllers/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: Image.asset(
              bankLoginBack,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 10.h, horizontal: 32.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(appIcon, height: 200, width: 250),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  text24("Register here",
                      color: Colors.white, fontWeight: FontWeight.bold),
                  SizedBox(
                    height: 16.h,
                  ),
                  TextFormField(
                    cursorColor: primaryColor,
                    controller: controller.nameController,
                    enableInteractiveSelection: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(
                        Icons.person_2_outlined,
                        color: primaryDarkColor,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 4.h, horizontal: 16.w),
                      hintText: "Full Name",
                      hintStyle: TextStyle(color: primaryColor),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  TextFormField(
                    cursorColor: primaryColor,
                    controller: controller.emailController,
                    enableInteractiveSelection: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: primaryDarkColor,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 4.h, horizontal: 16.w),
                      hintText: "Email",
                      hintStyle: TextStyle(color: primaryColor),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Obx(
                    () => TextFormField(
                        controller: controller.passwordController,
                        obscureText: controller.obscure.value,
                        enableInteractiveSelection: false,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 4.h, horizontal: 16.w),
                          hintText: "Password",
                          hintStyle: TextStyle(color: primaryColor),
                          prefixIcon: Icon(
                            Icons.key,
                            color: primaryDarkColor,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.obscure.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              controller.obscure.value =
                                  !controller.obscure.value;
                            },
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Obx(
                    () => TextFormField(
                        autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value !=
                              controller.passwordController.text) {
                            return 'Password does not match';
                          }
                          return null;
                        },
                        controller:
                            controller.passwordConfirmController,
                        obscureText: controller.obscureConfirm.value,
                        enableInteractiveSelection: false,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 4.h, horizontal: 16.w),
                          hintText: "Confirm Password",
                          hintStyle: TextStyle(color: primaryColor),
                          prefixIcon: Icon(
                            Icons.key,
                            color: primaryDarkColor,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.obscureConfirm.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              controller.obscureConfirm.value =
                                  !controller.obscureConfirm.value;
                            },
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  // RadioGroup for admin or mechanic

                  text12("Register as", color: Colors.white),

                  Obx(
                    () => SegmentedButton<Role>(
                      selected: {controller.selectedRole.value},
                      onSelectionChanged: (Set<Role> newSelection) {
                        controller.selectedRole.value =
                            newSelection.first;
                      },
                      segments: <ButtonSegment<Role>>[
                        ButtonSegment(
                          icon: Icon(
                            Icons.car_repair,
                            color: controller.selectedRole.value ==
                                    Role.admin
                                ? Colors.white
                                : Colors.black,
                          ),
                          label: text12(
                            'Mechanic',
                            color: controller.selectedRole.value ==
                                    Role.admin
                                ? Colors.white
                                : Colors.black,
                          ),
                          value: Role.mechanic,
                        ),
                        ButtonSegment(
                          icon: Icon(
                            Icons.admin_panel_settings_outlined,
                            color: controller.selectedRole.value ==
                                    Role.mechanic
                                ? Colors.white
                                : Colors.black,
                          ),
                          label: text12(
                            'Admin',
                            color: controller.selectedRole.value ==
                                    Role.mechanic
                                ? Colors.white
                                : Colors.black,
                          ),
                          value: Role.admin,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),

                  GestureDetector(
                    onTap: () {
                      controller.register();
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.white,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: text14('Register',
                              color: primaryDarkColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        text12("Have an account? ",
                            color: Colors.white),
                        text12(
                          "Login here.",
                          color: secondaryColor,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
