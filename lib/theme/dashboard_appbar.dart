import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ichiban_auto/theme/text_widgets.dart';

import '../../../../../theme/colors.dart';
import '../app/modules/home/controllers/home_controller.dart';
import '../app/routes/app_pages.dart';

AppBar customAppbarWidgetDashboard(HomeController controller) {
  return AppBar(
      automaticallyImplyLeading: false,
      // Set this height
      elevation: 0,
      backgroundColor: primaryColor,
      flexibleSpace: Builder(
        builder: (context) => Container(
          decoration: gradientShapeDecorator,
          child: Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [

                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: text16(
                        "Ichiban Auto",
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.offAllNamed(Routes.AUTH);
                            },
                            icon: Padding(
                              padding: EdgeInsets.only(right: 4.0),
                              child: Icon(
                                Icons.logout,
                                color: Colors.white,
                                size: 24,
                              ),

                            )
                        )

                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ));
}

AppBar customAppbarDetailsWidget(String title,
    [bool isSearch = false,
    TextEditingController? searchController,
    Function()? onSearch,
    IconData? icon,
    Function()? onListClick]) {
  RxBool isShowSearch = false.obs;
  return AppBar(
      automaticallyImplyLeading: false,
      // Set this height
      elevation: 0,
      backgroundColor: primaryColor,
      flexibleSpace: Builder(
        builder: (context) => Container(
          decoration: gradientShapeDecorator,
          child: Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Stack(
                  children: [
                    Stack(children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      Center(
                        child: text16(
                          title,
                          color: Colors.white,
                        ),
                      ),
                      isSearch
                          ? Positioned(
                              right: 0,
                              child: IconButton(
                                onPressed: () {
                                  searchController?.clear();
                                  print("hello2");
                                  // onSearch!();
                                  isShowSearch.value = !isShowSearch.value;
                                },
                                icon: const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            )
                          : Container(),
                    ]),
                    Obx(
                      () => isShowSearch.value
                          ? SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 44.w, right: 44.w, top: 8.h),
                                child: TextFormField(
                                  cursorColor: primaryColor,
                                  textAlign: TextAlign.center,
                                  controller: searchController,
                                  onChanged: (v) {
                                    onSearch!();
                                  },
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    contentPadding: EdgeInsets.all(0),
                                    filled: true,
                                    hintText: "Search Here",
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ),
                    icon != null
                        ? Positioned(
                            right: 0,
                            child: IconButton(
                                onPressed: () {

                                },
                                icon: Icon(
                                  icon,
                                  color: Colors.white,
                                  size: 30,
                                )),
                          )
                        : Container()
                  ],
                ),
              ),
            ),
          ),
        ),
      ));
}
