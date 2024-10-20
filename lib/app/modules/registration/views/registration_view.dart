import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../theme/Colors.dart';
import '../../../../theme/image_assets.dart';
import '../../../../theme/text_widgets.dart';
import '../../../../utils/utils.dart';
import '../../../routes/app_pages.dart';
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
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Expanded(child: Image.asset(appIcon, height: 200, width: 250)),
              SingleChildScrollView(
                child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 32.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text24("Register here",
                              color: Colors.white, fontWeight: FontWeight.bold),
                          SizedBox(
                            height: 16.h,
                          ),
                          TextFormField(
                            cursorColor: primaryColor,
                            // controller: controller.emailController,
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
                            // controller: controller.emailController,
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
                          TextFormField(
                            // controller: controller.passwordController,
                            // obscureText: controller.obscure.value,
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
                                    // controller.obscure.value
                                    true
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    // controller.obscure.value =
                                    // !controller.obscure.value;
                                  },
                                ),
                              )),
                          SizedBox(
                            height: 16.h,
                          ),
                          // RadioGroup for admin or mechanic
                
                
                          Obx(() =>
                              SegmentedButton<Role>(
                                selected: {controller.selecterRole.value},
                                onSelectionChanged: (Set<Role> newSelection) {
                                  controller.selecterRole.value = newSelection.first;
                                },
                                segments: const <ButtonSegment<Role>>[
                                  ButtonSegment(
                                    icon: Icon(Icons.car_repair),
                                    label: Text('Mechanic'),
                                    value: Role.mechanic,
                                  ),
                                  ButtonSegment(
                                    icon: Icon(Icons.admin_panel_settings_outlined),
                                    label: Text('Admin'),
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
                              // controller.signInWithEmailAndPassword();
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
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
