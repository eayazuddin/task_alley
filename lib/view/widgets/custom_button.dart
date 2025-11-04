import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors/app_colors.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.height = 48,
    this.width = double.maxFinite,
    required this.onTap,
    this.title = "Get Started",
    this.marginVertical = 0,
    this.marginHorizontal = 0,
    this.backgroundColor = AppColors.buttonColor,
    this.borderRadius = 6,
    this.fontSize = 16,
  });

  final double height;
  final double width;
  final double marginVertical;
  final double marginHorizontal;
  final double borderRadius;
  final double fontSize;

  final VoidCallback onTap;
  final String title;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: marginVertical.h,
          horizontal: marginHorizontal.w,
        ),
        alignment: Alignment.center,
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius.r),
          color: backgroundColor,
        ),
        child: CustomText(
          fontWeight: FontWeight.w600,
          fontSize: fontSize.sp,
          color: AppColors.white,
          textAlign: TextAlign.center,
          text: title,
        ),
      ),
    );
  }
}