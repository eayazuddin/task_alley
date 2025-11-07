import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_alley/view/screens/profile/screen/update_profile/controller/update_controller.dart';
import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../widgets/custom_text_field.dart';
import '../widget/profile_avatar.dart';

class UpdateProfileScreen extends StatelessWidget {
  UpdateProfileScreen({super.key});

  final controller = Get.put(UpdateProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Back Button
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  borderRadius: BorderRadius.circular(30.r),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(8.r),
                    child: const Icon(Icons.arrow_back_ios_new, size: 18),
                  ),
                ),
              ),

              SizedBox(height: 10.h),
              Text(
                "Update Profile",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 25.h),

              // Profile Image + Gallery Picker
              Obx(() {
                return ProfileAvatar(
                  imageFile: controller.selectedImage.value != null
                      ? File(controller.selectedImage.value!.path)
                      : null,
                  onPickImage: controller.pickImage,
                );
              }),
              SizedBox(height: 30.h),

              // Full Name Field
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Full Name",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 14.sp),
                ),
              ),
              SizedBox(height: 5.h),
              CustomTextField(
                textEditingController: controller.nameController.value,
                hintText: "e.g. Kristin",
                fillColor: const Color(0xFFF0F9F8),
                fieldBorderColor: Colors.transparent,
                focusBorderColor: AppColors.green,
              ),

              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email Address",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 14.sp),
                ),
              ),
              SizedBox(height: 5.h),
              CustomTextField(
                textEditingController: controller.emailController.value,
                hintText: "e.g. kristin.cooper@example.com",
                keyboardType: TextInputType.emailAddress,
                fillColor: const Color(0xFFF0F9F8),
                fieldBorderColor: Colors.transparent,
                focusBorderColor: AppColors.green,
              ),

              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Phone Number",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 14.sp),
                ),
              ),
              SizedBox(height: 5.h),
              CustomTextField(
                textEditingController: controller.phoneController.value,
                hintText: "e.g. (480) 555-0103",
                keyboardType: TextInputType.phone,
                fillColor: const Color(0xFFF0F9F8),
                fieldBorderColor: Colors.transparent,
                focusBorderColor: AppColors.green,
              ),

              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Location",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 14.sp),
                ),
              ),
              SizedBox(height: 5.h),
              CustomTextField(
                textEditingController: controller.locationController.value,
                hintText: "2118 Thornridge Cir. Syracuse, Connecticut...",
                fillColor: const Color(0xFFF0F9F8),
                fieldBorderColor: Colors.transparent,
                focusBorderColor: AppColors.green,
              ),

              SizedBox(height: 30.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                  ),
                  onPressed: () {
                    // Handle update logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Profile updated successfully!"),
                        backgroundColor: AppColors.green,
                      ),
                    );
                  },
                  child: Text(
                    "Update",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
