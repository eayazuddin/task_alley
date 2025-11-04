import 'package:flutter/material.dart';
import 'package:task_alley/view/widgets/custom_button.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/custom_text_field.dart';

class VerifyPhoneScreen extends StatefulWidget {
  const VerifyPhoneScreen({super.key});

  @override
  State<VerifyPhoneScreen> createState() => _VerifyPhoneScreenState();
}

class _VerifyPhoneScreenState extends State<VerifyPhoneScreen> {
  final phoneController = TextEditingController();

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
                "Verify Your Phone Number",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff111827),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "We’ll send a verification code to this phone number to confirm your account.",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff6B7280)
                ),
              ),
              const SizedBox(height: 20),
              CustomText(
                text: "Phone Number",
                fontSize: 14,
                color: Color(0xff111827),
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 6),
              CustomTextField(
                textEditingController: phoneController,
                hintText: "+234 701 234 5678",
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Enter your email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                title: "Send OTP",
                onTap: () {

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
