import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../widgets/custom_text.dart';

class AccountInfoRow extends StatelessWidget {
  final String title;
  final String value;

  const AccountInfoRow({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                CustomText(
                  text: title,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.w),
                  width: 1,
                  height: 20.h,
                  color: Colors.grey.shade300,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: CustomText(
              text: value,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
