import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/custom_refer_button.dart';
import '../widget/custom_table.dart';
import '../widget/referral_code_box.dart';


class ReferDiscountScreen extends StatefulWidget {
  const ReferDiscountScreen({super.key});

  @override
  State<ReferDiscountScreen> createState() => _ReferDiscountScreenState();
}

class _ReferDiscountScreenState extends State<ReferDiscountScreen> {
  int selectedTab = 0;
  final String referralCode = "TASK-USER123";

  final List<List<String>> discounts = [
    ["Got a referral", "Active", "₦1000", "—"],
    ["REF990", "Used", "₦400", "Jul 15, 2025"],
    ["Joined with a referral", "Used", "₦700", "Jul 15, 2025"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
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
                      child: Text(
                        "Refer & Discounts",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 25),
                ],
              ),
              SizedBox(height: 24.h),

              // Tabs
              Row(
                children: [
                  _buildTab("My Discounts", 0),
                  SizedBox(width: 10.w),
                  _buildTab("Referral Program", 1),
                ],
              ),

              SizedBox(height: 24.h),

              if (selectedTab == 0)
                CustomTable(
                  headers: const [
                    "Referral Type",
                    "Status",
                    "Value",
                    "Applied Date"
                  ],
                  rows: discounts,
                )
              else
                _buildReferralProgram(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    final bool isSelected = selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedTab = index),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF0E7C7B) : Colors.transparent,
            border: Border.all(
              color:
              isSelected ? const Color(0xFF0E7C7B) : Colors.grey.shade300,
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReferralProgram(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.discount_outlined,
                  color: Color(0xFF0E7C7B), size: 20),
              SizedBox(width: 6.w),
              Text(
                "Your Referral Code",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          ReferralCodeBox(
            code: referralCode,
            onCopy: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Referral code copied!"),
                  duration: Duration(seconds: 1),
                ),
              );
            },
          ),
          SizedBox(height: 20.h),
          CustomReferButton(
            text: "Share Link",
            isOutlined: true,
            onTap: () {
              // Share function here
            },
          ),
        ],
      ),
    );
  }
}
