// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:task_alley/core/routes/app_routes.dart';
// import 'package:task_alley/view/screens/auth/sign_up/screen/signup_page.dart';
// import 'package:task_alley/view/widgets/custom_button.dart';
// import '../../../../../gen/assets.gen.dart';
// import '../widget/role_card.dart';
//
// class RoleScreen extends StatefulWidget {
//   const RoleScreen({super.key});
//
//   @override
//   State<RoleScreen> createState() => _RoleScreenState();
// }
//
// class _RoleScreenState extends State<RoleScreen> {
//   String? selectedRole;
//   void _goNextPage() {
//     if (selectedRole == null) return;
//
//     if (selectedRole == "customer") {
//       Get.offAllNamed(AppRoutes.signupScreen);
//     } else if (selectedRole == "provider") {
//       Get.offAllNamed(AppRoutes.signupScreen);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 40),
//             const Text(
//               "Choose Your Role to Get Started",
//               style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               "Select the profile that best suits your journey. Whether you're here to book reliable services or offer them, we’ve built the right tools just for you.",
//               style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
//             ),
//             const SizedBox(height: 24),
//             RoleCard(
//               role: "customer",
//               title: "Customer",
//               imagePath: Assets.images.customer.path,
//               right: 40,
//               bottom: 50,
//               isSelected: selectedRole == "customer",
//               onTap: () => setState(() => selectedRole = "customer"),
//             ),
//             const SizedBox(height: 16),
//             // Provider Card
//             RoleCard(
//               role: "provider",
//               title: "Service\nProvider",
//               imagePath: Assets.images.serviceProvider.path,
//               right: 60,
//               bottom: 40,
//               isSelected: selectedRole == "provider",
//               onTap: () => setState(() => selectedRole = "provider"),
//             ),
//
//             const SizedBox(height: 10),
//             CustomButton(title: "Continue", onTap: _goNextPage),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../gen/assets.gen.dart';
import '../../../widgets/custom_button.dart';
import '../../auth/controller/auth_controller.dart';
import '../widget/role_card.dart';

class RoleScreen extends StatefulWidget {
  const RoleScreen({super.key});

  @override
  State<RoleScreen> createState() => _RoleScreenState();
}

class _RoleScreenState extends State<RoleScreen> {
  final AuthController controller = Get.put(AuthController());
  String? selectedRole;

  void _goNextPage() {
    if (selectedRole == null) return;
    controller.roleController.value.text = selectedRole!;
    Get.offAllNamed(AppRoutes.signupScreen, arguments: {'role': selectedRole});

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Text(
              "Choose Your Role to Get Started",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            const Text(
              "Select the profile that best suits your journey. Whether you're here to book reliable services or offer them, we’ve built the right tools just for you.",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 24),
            RoleCard(
              role: "customer",
              title: "Customer",
              imagePath: Assets.images.customer.path,
              right: 40,
              bottom: 50,
              isSelected: selectedRole == "customer",
              onTap: () => setState(() => selectedRole = "customer"),
            ),
            const SizedBox(height: 16),
            RoleCard(
              role: "provider",
              title: "Service\nProvider",
              imagePath: Assets.images.serviceProvider.path,
              right: 60,
              bottom: 40,
              isSelected: selectedRole == "provider",
              onTap: () => setState(() => selectedRole = "provider"),
            ),
            const SizedBox(height: 10),
            CustomButton(title: "Continue", onTap: _goNextPage),
          ],
        ),
      ),
    );
  }
}
