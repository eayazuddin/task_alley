import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_alley/view/screens/auth/controller/auth_controller.dart';
import 'package:task_alley/view/widgets/custom_button.dart';
import 'package:task_alley/view/widgets/custom_text.dart';
import 'package:task_alley/view/widgets/custom_text_field.dart';
import '../../../../../gen/assets.gen.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final controller = Get.find<AuthController>();
  final GlobalKey<FormState> _formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Provide Your Address",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Please provide your valid address, and verify it to confirm your identity.",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 20),

                  CustomText(text: "City / LGA", color: Colors.black),
                  SizedBox(height: 5),
                  CustomTextField(
                    textEditingController: controller.cityController.value,
                    fillColor: Color(0xffE6F4F1),
                  ),
                  CustomText(text: "Street Address", color: Colors.black),
                  SizedBox(height: 5),
                  CustomTextField(
                    textEditingController: controller.addressController.value,
                    fillColor: Color(0xffE6F4F1),
                  ),
                  const SizedBox(height: 10),
                  CustomText(
                    text: "Address verify Document",
                    color: Colors.black,
                  ),
                  const SizedBox(height: 10),

                  Obx(() {
                    final file = controller.documentPath.value;
                    print(file);
                    return GestureDetector(
                      onTap: controller.pickDocument,
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        height: 120,
                        width: 145,
                        decoration: BoxDecoration(
                          color: const Color(0xffE6F4F1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              Assets.icons.attatch.path,
                              height: 40,
                              width: 40,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              file == null
                                  ? "Upload Document"
                                  : "Document Selected",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  SizedBox(height: 20),
                  Obx(
                    () => controller.addressUpdateLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : CustomButton(
                            title: "Continue",
                            onTap: () {
                              if (!_formkey.currentState!.validate()) return;
                              controller.updateMyProfile();
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
