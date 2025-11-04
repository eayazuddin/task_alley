import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../change_password/screen/change_password_screen.dart';
import '../widget/setting_tile.dart';

class AccountSettingScreen extends StatelessWidget {
  const AccountSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(Icons.arrow_back_ios_new, size: 18),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  "Account Setting",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Change Password
              SettingTile(
                title: "Change Password",
                icon: Icons.lock_outline,
                onTap: () {
                  Get.to(ChangePasswordScreen());
                },
              ),

              const SizedBox(height: 20),

              // Delete Account
              SettingTile(
                title: "Delete Account",
                icon: Icons.person_off_outlined,
                isDanger: true,
                onTap: () {
                  // Handle delete account logic
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
