import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_alley/view/widgets/custom_text_field.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text.dart';
import '../../../identity_verification/screen/identity_verification.dart';

class VerifyBvnScreen extends StatefulWidget {
  const VerifyBvnScreen({super.key});

  @override
  State<VerifyBvnScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<VerifyBvnScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 32.0.h),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff111827),
                    text: "Verify Your BVN",
                  ),
                  SizedBox(height: 8.h),
                  CustomText(
                    fontSize: 14,
                    textAlign: TextAlign.start,
                    color: Color(0xff6B7280),
                    text: "Enter your 11-digit Bank Verification Number (BVN)\n for identity confirmation.",
                  ),
                  SizedBox(height: 23.h),

                  /// Email
                  CustomText(
                    text: "Bank Verification Number (BVN)",
                    fontSize: 14,
                    color: Color(0xff111827),
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 6.h),
                  CustomTextField(
                    textEditingController: emailController,
                    hintText: "Enter your 11-digit BVN",
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter your email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 23),
                  CustomButton(
                    title: "Verify",
                    onTap: () {
                      Get.to(IdentityVerification());
                    },
                  ),

                  SizedBox(height: 50.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
