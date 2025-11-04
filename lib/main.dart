import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_alley/utils/app_colors/app_colors.dart';
import 'core/routes/app_routes.dart';

void main() {
  runApp(const TaskAlley());
}

class TaskAlley extends StatelessWidget {
  const TaskAlley({super.key});

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
    designSize: const Size(390, 870),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (_, child) {
      return GetMaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.white,
          appBarTheme: const AppBarTheme(
            toolbarHeight: 65,
            elevation: 0,
            centerTitle: true,
            backgroundColor: AppColors.white,
            iconTheme: IconThemeData(color: AppColors.white),
          ),
        ),
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 200),
        initialRoute: AppRoutes.splashScreen,
        navigatorKey: Get.key,
        getPages: AppRoutes.routes,
      );
    },
  );
}
