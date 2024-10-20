import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ichiban_auto/theme/theme.dart';
import 'package:ichiban_auto/utils/utils.dart';

import 'app/routes/app_pages.dart';

void main() {

  Utils.configLoading();

  runApp(ScreenUtilInit(
    designSize: const Size(360, 800),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) {
      return GetMaterialApp(
        //You can use the library anywhere in the app even in theme
        theme: theme(),
        home: child,
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      );
    },
  ),
  );
}

