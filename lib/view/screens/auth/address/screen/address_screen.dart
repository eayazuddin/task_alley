import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:task_alley/view/widgets/custom_button.dart';
import 'package:task_alley/view/widgets/custom_text.dart';
import 'package:task_alley/view/widgets/custom_text_field.dart';
import '../../../../../gen/assets.gen.dart';
import '../../referral/screen/referral_screen.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final cityController = TextEditingController();
  final addressController = TextEditingController();

  String? documentPath;

  Future<void> pickDocument() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        documentPath = result.files.single.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
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
                textEditingController: cityController,
                fillColor: Color(0xffE6F4F1),
              ),
              CustomText(text: "Street Address", color: Colors.black),
              SizedBox(height: 5),
              CustomTextField(
                textEditingController: addressController,
                fillColor: Color(0xffE6F4F1),
              ),
              const SizedBox(height: 10),
              CustomText(text: "Address verify Document", color: Colors.black),
              const SizedBox(height: 10),

              GestureDetector(
                onTap: pickDocument,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  height: 120,
                  width: 145,
                  decoration: BoxDecoration(
                    color: Color(0xffE6F4F1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage(Assets.icons.attatch.path)),
                      Text(
                        documentPath == null
                            ? "Upload Document"
                            : "Document Selected",
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              CustomButton(
                title: "Continue",
                onTap: () {
                  print("Lo");
                  // Get.to(ReferralScreen);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ReferralScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
