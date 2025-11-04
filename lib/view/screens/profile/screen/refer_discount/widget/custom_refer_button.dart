import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomReferButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isOutlined;

  const CustomReferButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        height: 46.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isOutlined ? Colors.transparent : const Color(0xFF0E7C7B),
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: const Color(0xFF0E7C7B),
            width: 1.4,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: isOutlined ? const Color(0xFF0E7C7B) : Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
            if (isOutlined) ...[
              SizedBox(width: 8.w),
              const Icon(Icons.arrow_outward_rounded,
                  size: 18, color: Color(0xFF0E7C7B)),
            ]
          ],
        ),
      ),
    );
  }
}
