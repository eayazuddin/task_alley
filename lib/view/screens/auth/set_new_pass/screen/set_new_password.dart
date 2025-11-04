import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../customer/onboarding/screen/onboarding.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/custom_text_field.dart';

class SetPasswordScreen extends StatefulWidget {
  final String email;
  final String otp;

  const SetPasswordScreen({
    super.key,
    required this.email,
    required this.otp,
  });

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff111827),
                      text: "Set Your New Password",
                    ),
                    SizedBox(height: 8.h),
                    CustomText(
                      color: Color(0xff6B7280),
                      text: "Create a secure password to protect your account\n and get started seamlessly!",
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 35.h),
                    CustomText(
                      text: "SetPassword Desc",
                      fontSize: 14,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 5.h),
                    /// Password
                    CustomTextField(
                      textEditingController: passwordController,
                      hintText: "Password Hint",
                      isPassword: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 12.h),
                    CustomText(
                      text: "Password",
                      fontSize: 14,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 5.h),
              
                    /// Confirm Password
                    CustomTextField(
                      textEditingController: confirmPasswordController,
                      hintText: "Confirm Password Hint",
                      isPassword: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your password again';
                        } else if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.h),
                    CustomButton(
                      backgroundColor: Color(0xff115E59),
                        title: "Continue",
                        onTap: (){
                        Get.to(CusOnboardingScreen());
                    })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
