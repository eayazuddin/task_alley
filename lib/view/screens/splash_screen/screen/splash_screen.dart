import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task_alley/core/routes/app_routes.dart';
import 'package:task_alley/gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
    Get.offAllNamed(AppRoutes.loginPage);       ///------  login -------///
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: SizedBox(
            width: double.infinity,
            child: SvgPicture.asset(Assets.images.logo),
          ),
        ),
      ),
    );
  }
}
