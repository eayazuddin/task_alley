import 'package:flutter/material.dart';
import '../../../../gen/assets.gen.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';

class Budget extends StatefulWidget {
  const Budget({super.key});

  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    Assets.icons.postTask.path,
                    height: 18,
                    width: 18,
                    color: const Color(0xff115E59),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Budget",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xff115E59),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              const Text(
                "How should the task be done?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(hintText: "e.g., ₦ 500"),
              SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    side: const BorderSide(color: Colors.grey, width: 1.5),
                    visualDensity: VisualDensity.compact,
                  ),
                  Expanded(
                    child: Text(
                      "I confirm this task complies with all platform rules and community guidelines.",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                        height: 1.4, // spacing between lines
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.teal, width: 1.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                      child: const Text(
                        "Previous",
                        style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: CustomButton(
                      title: "Post Task ",
                      width: 130,
                      onTap: () {
                        // Get.to(Budget());
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
