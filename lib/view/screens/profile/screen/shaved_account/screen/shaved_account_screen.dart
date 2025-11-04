import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../widgets/custom_text.dart';
import '../../pay_with_card/screen/pay_with_card_screen.dart';
import '../widget/account_info_row.dart';

class ShavedAccountScreen extends StatelessWidget {
  const ShavedAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back + Title
              Row(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(30.r),
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: const Icon(Icons.arrow_back_ios_new, size: 18),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: CustomText(
                        text: "Shaved  Account",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 25),
                ],
              ),

              SizedBox(height: 24.h),

              // Header with "Update" button
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F6F4),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Shaved Account",
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(PayWithCardScreen());
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          color: const Color(0xFF009B7D),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.edit_outlined,
                                color: AppColors.white, size: 16.sp),
                            SizedBox(width: 4.w),
                            CustomText(
                              text: "Update",
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 13.sp,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )

              ),

              // Table-style info
              SizedBox(height: 16.h),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  children: const [
                    AccountInfoRow(
                      title: "Bank Name",
                      value: "Alpha Morgan Bank",
                    ),
                    Divider(height: 1, color: Colors.grey),
                    AccountInfoRow(
                      title: "Account No",
                      value: "0016563228",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
