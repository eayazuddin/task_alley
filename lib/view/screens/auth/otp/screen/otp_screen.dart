import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_alley/view/widgets/custom_button.dart';
import '../../controller/auth_controller.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  void initState() {
    super.initState();
  }

  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final email = args?['email'] ?? '';

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "5-digit code",
                style: TextStyle(
                  color: Color(0xff111827),
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Please enter the code we’ve sent",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xff6B7280),
                ),
              ),
              const SizedBox(height: 30),

              //=========== OTP Input Field ============

              PinCodeTextField(
                appContext: context,
                controller: controller.otpController.value,
                length: 5,
                animationType: AnimationType.fade,
                keyboardType: TextInputType.number,
                onChanged: (value) {},
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 50,
                  fieldWidth: 45,
                  activeFillColor: Colors.white,
                  inactiveFillColor: const Color(0xffE6F4F1),
                  selectedFillColor: Colors.grey.shade200,
                  activeColor: Colors.teal,
                  selectedColor: Colors.teal,
                  inactiveColor: Colors.grey,
                ),
                enableActiveFill: true,
              ),

              const SizedBox(height: 20),
              // Confirm Button
              CustomButton(
                title: "Confirm",
                onTap: () {
                  final otp = controller.otpController.value.text.trim();
                  if (otp.isEmpty) {
                    Get.snackbar("Error", "Please enter OTP");
                  } else {
                    controller.signUpOtp(email: email, otp: otp);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
