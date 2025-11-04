import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReferralCodeBox extends StatelessWidget {
  final String code;
  final VoidCallback onCopy;

  const ReferralCodeBox({
    super.key,
    required this.code,
    required this.onCopy,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            alignment: Alignment.center,
            child: const Icon(Icons.person_outline, color: Colors.black54),
          ),
          Expanded(
            child: Text(
              code,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          InkWell(
            onTap: onCopy,
            borderRadius: BorderRadius.circular(8.r),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: const Color(0xFF0E7C7B),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(7.r),
                  bottomRight: Radius.circular(7.r),
                ),
              ),
              child: Text(
                "Copy Code",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
