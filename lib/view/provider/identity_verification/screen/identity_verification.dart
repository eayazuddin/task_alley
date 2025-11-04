import 'package:flutter/material.dart';
import 'package:task_alley/utils/app_colors/app_colors.dart';
import 'package:task_alley/view/widgets/custom_button.dart';
import 'package:task_alley/view/widgets/custom_text.dart';
import 'package:task_alley/view/widgets/custom_text_field.dart';

import '../../../../gen/assets.gen.dart';

class IdentityVerification extends StatefulWidget {
  const IdentityVerification({super.key});

  @override
  State<IdentityVerification> createState() => _IdentityVerificationState();
}
class _IdentityVerificationState extends State<IdentityVerification> {
  String? selectedValue;
  List<String> menuList = [
    "National Identification Number(NIN)",
    "Voter's Card",
    "International Passport",
    "Driver's License",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Complete Identity\nVerification",
                textAlign: TextAlign.start,
                fontSize: 26,
                fontWeight: FontWeight.w500,
                color: Color(0xff111827),
              ),
              SizedBox(height: 8),
              CustomText(
                text:
                    "Verify your identity with NIN or other accepted\ndocuments using Smile ID’s secure process.",
                color: Color(0xff6B7280),
                fontWeight: FontWeight.w400,
                fontSize: 14,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 8),
              CustomText(
                text: "Select Identification Document",
                textAlign: TextAlign.start,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff111827),
              ),
              SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6F4F1), // light mint-like color
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedValue,
                    hint: const Text(
                      "Select One",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    isExpanded: true,
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.black54,
                    ),
                    items: List.generate(menuList.length, (index) {
                      return DropdownMenuItem<String>(
                        value: menuList[index],
                        child: Text(
                          menuList[index],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      );
                    }),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 8),
              CustomText(
                text: "Enter ID Number",
                textAlign: TextAlign.start,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff111827),
              ),
              CustomTextField(
                hintText: "Enter your ID number",
                hintTextColor: Color(0xff6B7280),
              ),
              SizedBox(height: 10),
              CustomText(
                text: "Upload Address Document",
                textAlign: TextAlign.start,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff111827),
              ),
              SizedBox(height: 10),
              Container(
                height: 100,
                width: 138,
                decoration: BoxDecoration(
                  color: Color(0xffE6F4F1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Image(image: AssetImage(Assets.icons.attatch.path)),
                ),
              ),
              SizedBox(height: 15),
              CustomButton(title: "Next", onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
