import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../../../utils/app_colors/app_colors.dart';

class ProfileAvatar extends StatelessWidget {
  final File? imageFile;
  final VoidCallback onPickImage;

  const ProfileAvatar({
    super.key,
    required this.imageFile,
    required this.onPickImage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey[200],
          backgroundImage: imageFile != null
              ? FileImage(imageFile!)
              : const NetworkImage("https://i.pravatar.cc/150?img=3")
          as ImageProvider,
        ),
        Positioned(
          bottom: 4,
          right: 4,
          child: InkWell(
            onTap: onPickImage,
            borderRadius: BorderRadius.circular(30),
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: AppColors.green,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
