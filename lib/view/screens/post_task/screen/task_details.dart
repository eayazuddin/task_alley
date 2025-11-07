import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../gen/assets.gen.dart';
import '../../../widgets/CustomAppBar.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';
import 'date_time.dart';

class TaskDetails extends StatefulWidget {
  const TaskDetails({super.key});

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  final TextEditingController tDController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  // Pick image only from gallery

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() => _selectedImage = File(image.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final String title = args['title'] ?? '';
    final String category = args['category'] ?? '';

    print(title);
    print(category);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Post Task',
        onBack: () => Navigator.pop(context),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    Assets.icons.postTask.path,
                    height: 18,
                    width: 18,
                    color: Color(0xff115E59),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Task details",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xff115E59),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Task description",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              CustomTextField(
                textEditingController: tDController,
                maxLines: 3,
                hintText:
                    "Clearly explain what needs to be done, including details like"
                    " location, required tools, and specific expectations",
                hintTextColor: Colors.grey,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter task details";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Attachments (optional)",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff111827),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  _pickImage();
                },
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Color(0xffE6F4F1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Assets.icons.attatch.path),
                      Text("Upload Images"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
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
                      title: "Next ",
                      width: 130,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          final taskData = {
                            'title': title,
                            'category': category,
                            'description': tDController.text,
                            'image': _selectedImage?.path,
                          };

                          Get.to(const DateAndTime(), arguments: taskData);
                        }
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
