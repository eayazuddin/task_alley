import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task_alley/view/screens/post_task/controller/post_controller.dart';
import '../../../../gen/assets.gen.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';

class Budget extends StatefulWidget {
  const Budget({super.key});

  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _budgetController = TextEditingController();
 final PostController controller = Get.find<PostController>();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {

    final args = Get.arguments;

    final String title = args['title'] ?? '';
    final String category = args['category'] ?? '';
    final String description = args['description'] ?? '';
    final String? imagePath = args['image'];
    final String? taskDone = args['taskDone'];
    final String? locationController = args['locationController'];
    final String? whenTaskDone = args['whenTaskDone'];
    final String? selectedDate = args['selectedDate'];
    final String? selectedTime = args['selectedTime'];
    final String? hTaskDone = args['hTaskDone'];
    final String? wTaskDone = args['wTaskDone'];

    print('Title: $title');
    print('Category: $category');
    print('Description: $description');
    print('Image: $imagePath');
    print('taskDone: $taskDone');
    print('locationController: $locationController');
    print('whenTaskDone: $whenTaskDone');
    print('selectedDate: $selectedDate');
    print('selectedTime: $selectedTime');
    print('hTaskDone: $hTaskDone');
    print('wTaskDone: $wTaskDone');



    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Header
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
                const SizedBox(height: 10),

                const Text(
                  "Enter your task budget",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 10),

                /// Budget Text Field
                CustomTextField(
                  textEditingController: _budgetController,
                  hintText: "e.g., ₦ 500",
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your budget amount";
                    }
                    // Optional: numeric validation
                    if (double.tryParse(value.replaceAll(RegExp(r'[^0-9.]'), '')) == null) {
                      return "Please enter a valid number";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 5),

                /// Terms Checkbox
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
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
                if (!isChecked)
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      "You must agree before posting your task",
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),

                const SizedBox(height: 20),

                /// Buttons
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          // Go back or navigate to previous step
                          Navigator.pop(context);
                        },
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
                    const SizedBox(width: 15),
                    Expanded(
                      child: CustomButton(
                        title: "Post Task",
                        width: 130,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            if (!isChecked) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      "Please confirm that your task complies with all platform rules."),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              return;
                            }

                            // All validations passed
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Task posted successfully!"),
                                backgroundColor: Colors.green,
                              ),
                            );

                            // Example: Navigate to another screen
                            // Get.to(() => SuccessScreen());
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
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import '../../../../gen/assets.gen.dart';
// import '../../../widgets/custom_button.dart';
// import '../../../widgets/custom_text_field.dart';
//
// class Budget extends StatefulWidget {
//   const Budget({super.key});
//
//   @override
//   State<Budget> createState() => _BudgetState();
// }
//
// class _BudgetState extends State<Budget> {
//   bool isChecked = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Image.asset(
//                     Assets.icons.postTask.path,
//                     height: 18,
//                     width: 18,
//                     color: const Color(0xff115E59),
//                   ),
//                   const SizedBox(width: 10),
//                   const Text(
//                     "Budget",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 16,
//                       color: Color(0xff115E59),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 10),
//               const Text(
//                 "How should the task be done?",
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               CustomTextField(hintText: "e.g., ₦ 500"),
//               SizedBox(height: 5),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Checkbox(
//                     value: isChecked,
//                     onChanged: (value) {
//                       setState(() {
//                         isChecked = value!;
//                       });
//                     },
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(3),
//                     ),
//                     side: const BorderSide(color: Colors.grey, width: 1.5),
//                     visualDensity: VisualDensity.compact,
//                   ),
//                   Expanded(
//                     child: Text(
//                       "I confirm this task complies with all platform rules and community guidelines.",
//                       style: const TextStyle(
//                         color: Colors.grey,
//                         fontSize: 13,
//                         height: 1.4, // spacing between lines
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 children: [
//                   Expanded(
//                     child: OutlinedButton(
//                       onPressed: () {},
//                       style: OutlinedButton.styleFrom(
//                         side: const BorderSide(color: Colors.teal, width: 1.5),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 24,
//                           vertical: 12,
//                         ),
//                       ),
//                       child: const Text(
//                         "Previous",
//                         style: TextStyle(
//                           color: Colors.teal,
//                           fontWeight: FontWeight.w600,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 15),
//                   Expanded(
//                     child: CustomButton(
//                       title: "Post Task ",
//                       width: 130,
//                       onTap: () {
//                         // Get.to(Budget());
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
