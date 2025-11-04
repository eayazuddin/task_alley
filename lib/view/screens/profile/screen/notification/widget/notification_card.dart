import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../widgets/custom_text.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final VoidCallback onClose;

  const NotificationCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile icon / image
          CircleAvatar(
            radius: 22.r,
            backgroundColor: AppColors.fillColor,
            backgroundImage: NetworkImage(imageUrl),
          ),

          SizedBox(width: 10.w),

          // Title + Description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title,
                  fontWeight: FontWeight.w600,
                  fontSize: 15.sp,
                ),
                SizedBox(height: 4.h),
                CustomText(
                  text: description,
                  fontWeight: FontWeight.w400,
                  fontSize: 13.sp,
                  color: AppColors.black,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // Close button
          IconButton(
            icon: const Icon(Icons.close, size: 18),
            color: AppColors.black,
            onPressed: onClose,
          ),
        ],
      ),
    );
  }
}
