import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ichiban_auto/theme/theme.dart';
import 'package:ichiban_auto/utils/utils.dart';

import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // Ensures that widget binding is initialized before running the app.
  WidgetsFlutterBinding.ensureInitialized();

  // Initializes Firebase with the default options for the current platform.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Configures the loading settings using a utility function.
  Utils.configLoading();

  // Runs the Flutter application with screen size adaptation and routing.
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          // Applies the custom theme to the application.
          theme: theme(),
          // Sets the home widget of the application.
          home: child,
          // Hides the debug banner in the top right corner.
          debugShowCheckedModeBanner: false,
          // Initializes the EasyLoading library.
          builder: EasyLoading.init(),
          // Sets the initial route of the application.
          initialRoute: AppPages.INITIAL,
          // Defines the routes for the application.
          getPages: AppPages.routes,
        );
      },
    ),
  );
}