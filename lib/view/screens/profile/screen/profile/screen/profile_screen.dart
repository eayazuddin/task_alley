import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../account_setting/screen/account_setting_screen.dart';
import '../../my_profile/screen/my_profile_screen.dart';
import '../../notification/screen/notification_screen.dart';
import '../../refer_discount/screen/refer_discount_screen.dart';
import '../../shaved_account/screen/shaved_account_screen.dart';
import '../widget/profile_option_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Section with background image + profile pic
              Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  // Background image
                  Image.asset(
                    Assets.images.profilePersonBack.path,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  // Profile image (forward)
                  Positioned(
                    bottom: -45,
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 52,
                        backgroundImage: AssetImage(Assets.images.person.path),
                        // backgroundImage:sdc
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              const Text(
                "Jane Cooper",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    ProfileOptionTile(
                      title: "My Profile",
                      icon: Icons.person_outline,
                      onTap: () {
                        Get.to(MyProfileScreen());
                      },
                    ),
                    ProfileOptionTile(
                      title: "Account Setting",
                      icon: Icons.settings_outlined,
                      onTap: () {
                        Get.to(AccountSettingScreen());
                      },
                    ),
                    ProfileOptionTile(
                      title: "Refer & Discounts",
                      icon: Icons.card_giftcard_outlined,
                      onTap: () {
                        Get.to(ReferDiscountScreen());
                      },
                    ),
                    ProfileOptionTile(
                      title: "Shaved Account",
                      icon: Icons.account_balance_wallet_outlined,
                      onTap: () {
                        Get.to(ShavedAccountScreen());
                      },
                    ),
                    ProfileOptionTile(
                      title: "Notification",
                      icon: Icons.notifications_none,
                      onTap: () {
                        Get.to(NotificationScreen());
                      },
                    ),
                    const SizedBox(height: 16),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "More",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    ProfileOptionTile(
                      title: "Terms & Condition",
                      icon: Icons.description_outlined,
                    ),
                    ProfileOptionTile(
                      title: "Privacy Policy",
                      icon: Icons.privacy_tip_outlined,
                    ),
                    ProfileOptionTile(
                      title: "Help/Support",
                      icon: Icons.help_outline,
                    ),
                    ProfileOptionTile(
                      title: "Log Out",
                      icon: Icons.logout,
                      arrowHide: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
