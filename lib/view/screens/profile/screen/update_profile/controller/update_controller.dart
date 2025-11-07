import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_alley/service/api_service.dart';
import 'package:task_alley/service/api_url.dart';

class UpdateProfileController extends GetxController{

  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> locationController = TextEditingController().obs;

  final Rx<File?> selectedImage = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();

  RxBool isUpdateLoading = false.obs;
  Future<void> pickImage() async {
    final XFile? pickedFile =
    await _picker.pickImage(source: ImageSource.camera, imageQuality: 80);

    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path); //  Convert XFile → File
    }
  }
  Future<void> updateProfile ()async {
    final body ={

    };
     // final response = await ApiClient.patchData(ApiUrl.updateMyProfile, body)
  }


}