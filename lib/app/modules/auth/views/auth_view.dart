import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ichiban_auto/app/routes/app_pages.dart';

import '../../../../theme/Colors.dart';
import '../../../../theme/image_assets.dart';
import '../../../../theme/text_widgets.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});
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
          Column(
            children: [
              Expanded(

                  child: Image.asset(appIcon, height: 200, width: 250)),
              Container(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 10.h, horizontal: 32.w),
                    child: Obx(
                          () =>  Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text24("Welcome",
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
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

                          TextFormField(
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

                          SizedBox(
                            height: 16.h,
                          ),

                          GestureDetector(
                            onTap: () {
                              controller.signInWithEmailAndPassword();
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              color: Colors.white,
                              child: Center(
                                child: Padding(
                                  padding:
                                  EdgeInsets.symmetric(vertical: 10.h),
                                  child: text14('Login',
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
                              Get.toNamed(Routes.REGISTRATION);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                text12("Don't have an account? ",
                                    color: Colors.white),
                                text12("Register here.",
                                    color: secondaryColor,),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
