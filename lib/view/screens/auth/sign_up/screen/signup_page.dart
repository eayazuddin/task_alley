import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../controller/auth_controller.dart';
import '../../login/screen/login_page.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final  controller = Get.find<AuthController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RxBool rememberMe = false.obs;

  @override
  Widget build(BuildContext context) {
    // 👇 Receive argument
    final args = Get.arguments;
    final role = args['role'];
    print('*************************************************');
    print(role);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  text: "Create Account",
                ),
                SizedBox(height: 8.h),
                CustomText(
                  color: Colors.black54,
                  text: "Sign up to get started",
                ),
                SizedBox(height: 20.h),
                // NAME
                CustomText(
                  text: "Full Name",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 6.h),
                CustomTextField(
                  textEditingController: controller.nameController.value,
                  hintText: "Enter your full name",
                  validator: (value) {
                    if (value?.isEmpty ?? true) return 'Please enter your name';
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                // EMAIL
                CustomText(
                  text: "Email",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 6.h),
                CustomTextField(
                  textEditingController: controller.emailController.value,
                  hintText: "Enter your email",
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                // PHONE
                CustomText(
                  text: "Phone",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 6.h),
                CustomTextField(
                  textEditingController: controller.phoneController.value,
                  hintText: "Enter your phone number",
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                // PASSWORD
                CustomText(
                  text: "Password",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 6.h),
                CustomTextField(
                  textEditingController: controller.passwordController.value,
                  hintText: "Enter your password",
                  isPassword: true,
                  validator: (value) {
                    if (value?.isEmpty ?? true || value!.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),

                // CONFIRM PASSWORD
                CustomText(
                  text: "Confirm Password",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 6.h),
                CustomTextField(
                  textEditingController:
                      controller.confirmPasswordController.value,
                  hintText: "Confirm your password",
                  isPassword: true,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please confirm your password';
                    }
                    if (value != controller.passwordController.value.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                // TERMS CHECKBOX
                Obx(
                  () => Row(
                    children: [
                      Checkbox(
                        value: rememberMe.value,
                        activeColor: Colors.green,
                        onChanged: (val) => rememberMe.value = val ?? false,
                      ),
                      const Text("I agree to the Terms & Conditions"),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),

                // SIGN UP BUTTON
                Obx(
                  () => controller.signUpLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : CustomButton(
                          title: "Sign Up",
                          backgroundColor: Colors.lightGreen,
                          onTap: () {
                            if (!_formKey.currentState!.validate()) return;

                            if (!rememberMe.value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Please accept terms & conditions",
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              return;
                            }
                            controller.signUp(role);
                          },
                        ),
                ),
                SizedBox(height: 20.h),

                // ALREADY HAVE AN ACCOUNT
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? "),
                    GestureDetector(
                      onTap: () => Get.offAll(() => LoginPage()),
                      child: const Text(
                        "Log In",
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
    );
  }
}
