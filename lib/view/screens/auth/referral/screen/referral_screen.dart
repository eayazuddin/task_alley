import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task_alley/view/widgets/custom_button.dart';
import 'package:task_alley/view/widgets/custom_text.dart';
import 'package:task_alley/view/widgets/custom_text_field.dart';
import '../../verify_phone/screen/verify_phone_screen.dart';

class ReferralScreen extends StatefulWidget {
  const ReferralScreen({super.key});

  @override
  State<ReferralScreen> createState() => _ReferralScreenState();
}

class _ReferralScreenState extends State<ReferralScreen> {
  final referralController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Have a Referral Code?\nUnlock Your Reward",
                style: TextStyle(
                  color: Color(0xff111827),
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 10),
              const Text(
                "Apply a referral code and get 10% OFF your first task – up to ₦50!",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xff6B7280),
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 20),

              CustomText(
                color: Color(0xff111827),
                fontWeight: FontWeight.w500,
                fontSize: 14,
                text: "Referral Code (Optional)",
              ),
              const SizedBox(height: 5),
              CustomTextField(
                textEditingController: referralController,
                hintText: "e.g. TASK-USER123",
              ),
              const SizedBox(height: 20),

              CustomButton(
                title: "Apply Code & Continue",
                onTap: () {
                  Get.to(VerifyPhoneScreen());
                },
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black
                      ),
                      borderRadius: BorderRadius.circular(5))

                ),
                onPressed: () {
                  Get.to(VerifyPhoneScreen());
                },
                child: Text("Skip & Continue Without Code",style: TextStyle(
                  color: Color(0xff115E59),
                  fontSize: 14,
                  fontWeight: FontWeight.w600
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
