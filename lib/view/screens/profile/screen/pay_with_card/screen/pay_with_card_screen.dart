import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../widgets/custom_button.dart';
import '../widget/card_info_field.dart';
import '../widget/card_number_field.dart';
import '../widget/payment_footer.dart';
import '../widget/payment_header.dart';

class PayWithCardScreen extends StatelessWidget {
  const PayWithCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PaymentHeader(),
                SizedBox(height: 16.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Your Business\nLogo Here",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "+233241234567@gmail.com",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "Pay NGN 350",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.green.shade700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 28.h),
                Center(
                  child: Text(
                    "Enter your card details to pay",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),

                SizedBox(height: 24.h),

                const CardNumberField(
                  label: "Card Number",
                  number: "1111 2222 3333 4444",
                ),
                SizedBox(height: 18.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardInfoField(
                      label: "Card Expiry",
                      value: "08/24",
                      width: 160.w,
                    ),
                    CardInfoField(
                      label: "CVV",
                      value: "123",
                      width: 140.w,
                    ),
                  ],
                ),

                SizedBox(height: 28.h),
                CustomButton(
                  title: "Save",
                  onTap: () {},
                  backgroundColor: Colors.green,
                ),

                SizedBox(height: 20.h),
                Text(
                  "An additional E-levy fee of 1% may apply to this payment. Learn more.",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey.shade600,
                  ),
                  textAlign: TextAlign.center,
                ),

                const PaymentFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
