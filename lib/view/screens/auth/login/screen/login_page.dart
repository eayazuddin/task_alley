import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../controller/auth_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final controller = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    text: "Welcome Back",
                  ),
                  SizedBox(height: 8.h),
                  CustomText(
                    color: Colors.black54,
                    text: "Sign in to continue",
                  ),
                  SizedBox(height: 23.h),
                  // Email Field
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: "Email",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  CustomTextField(
                    textEditingController: controller.loginEmailController,
                    hintText: "Enter your email",
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 23.h),
                  // Password Field
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: "Password",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  CustomTextField(
                    textEditingController: controller.loginPasswordController,
                    hintText: "Enter your password",
                    isPassword: true,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 20.h),

                  // Login Button with Loading
                  Obx(
                    () => controller.loginLoading.value
                        ? const CircularProgressIndicator()
                        : CustomButton(
                            title: "Log In",
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                controller.login();
                              }
                            },
                          ),
                  ),

                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? "),
                      GestureDetector(
                        onTap: () => Get.offAllNamed(AppRoutes.roleScreen),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
