import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../widgets/custom_text_field.dart';
import '../widget/profile_avatar.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  // Pick image only from gallery
  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() => _selectedImage = File(image.path));
    }
  }

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
              ProfileAvatar(
                imageFile: _selectedImage,
                onPickImage: _pickImage, // directly pick from gallery
              ),

              SizedBox(height: 30.h),

              // Full Name Field
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Full Name",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
                ),
              ),
              SizedBox(height: 5.h),
              CustomTextField(
                textEditingController: nameController,
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
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
                ),
              ),
              SizedBox(height: 5.h),
              CustomTextField(
                textEditingController: emailController,
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
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
                ),
              ),
              SizedBox(height: 5.h),
              CustomTextField(
                textEditingController: phoneController,
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
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
                ),
              ),
              SizedBox(height: 5.h),
              CustomTextField(
                textEditingController: locationController,
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
