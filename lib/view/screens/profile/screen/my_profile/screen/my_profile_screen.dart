import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../widget/circle_icon_button.dart';
import '../../../widget/profile_info_tile.dart';
import '../../update_profile/screen/update_profile_screen.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              // Top bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleIconButton(
                    icon: Icons.arrow_back_ios_new,
                    onTap: () => Navigator.pop(context),
                  ),
                  const Text(
                    "My Profile",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  CircleIconButton(
                    icon: Icons.edit_outlined,
                    onTap: () {
                      Get.to(UpdateProfileScreen());
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // 🔹 Profile Image
               CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(Assets.images.person.path),
              ),
              const SizedBox(height: 25),

              // 🔹 Info Fields
              const ProfileInfoTile(
                icon: Icons.person_outline,
                text: "Jane Cooper",
              ),
              const ProfileInfoTile(
                icon: Icons.phone_outlined,
                text: "(480) 555-0103",
              ),
              const ProfileInfoTile(
                icon: Icons.email_outlined,
                text: "debra.holt@example.com",
              ),
              const ProfileInfoTile(
                icon: Icons.location_on_outlined,
                text: "2118 Thornridge Cir. Syracuse, Connecticut",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
