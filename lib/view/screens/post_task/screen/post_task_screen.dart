
import 'package:flutter/material.dart';
import 'package:task_alley/view/screens/post_task/screen/task_details.dart';
import 'package:task_alley/view/widgets/custom_button.dart';
import 'package:task_alley/view/widgets/custom_text_field.dart';
import '../../../../gen/assets.gen.dart';
import '../../../widgets/CustomAppBar.dart';
import '../widget/CustomDropDownWidget.dart';

class PostTaskScreen extends StatefulWidget {
  const PostTaskScreen({super.key});

  @override
  State<PostTaskScreen> createState() => _PostTaskScreenState();
}

class _PostTaskScreenState extends State<PostTaskScreen> {

  final TextEditingController tEController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Post Task',
        onBack: () => Navigator.pop(context),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Header Row
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
                      "Task Overview",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xff115E59),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                /// Task Title Label
                const Text(
                  "Task Title",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                /// Text Field
                CustomTextField(
                  textEditingController: tEController,
                  hintText: "e.g., Fix leaking kitchen tap",
                  hintTextColor: const Color(0xff6B7280),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter a task title";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 10),
                /// Dropdown Field
                CustomDropDownWidget(
                  label: "Task Category",
                  hint: "Select Category",
                  items: ["Cleaning", "Delivery", "Tutoring", "Gardening"],
                  onChanged: (value) {
                    selectedCategory = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please select a category";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                /// Submit Button
                CustomButton(
                  title: "Next",
                  width: 130,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TaskDetails(),
                        ),
                      );
                    }
                  },
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
// import 'package:task_alley/view/screens/post_task/screen/task_details.dart';
// import 'package:task_alley/view/widgets/custom_button.dart';
// import 'package:task_alley/view/widgets/custom_text_field.dart';
// import '../../../../gen/assets.gen.dart';
// import '../../../widgets/CustomAppBar.dart';
// import '../widget/CustomDropDownWidget.dart';
// import 'date_time.dart';
//
// class PostTaskScreen extends StatefulWidget {
//   const PostTaskScreen({super.key});
//
//   @override
//   State<PostTaskScreen> createState() => _PostTaskScreenState();
// }
//
// var selectedIndex = 0;
//
// class _PostTaskScreenState extends State<PostTaskScreen> {
//
//
//   final TextEditingController tEController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: 'Post Task',
//         onBack: () => Navigator.pop(context),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Image.asset(
//                     Assets.icons.postTask.path,
//                     height: 18,
//                     width: 18,
//                     color: Color(0xff115E59),
//                   ),
//                   SizedBox(width: 10),
//                   Text(
//                     "Task Overview",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 16,
//                       color: Color(0xff115E59),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 10),
//               Row(
//                 children: [
//                   Text(
//                     "Task Title",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//               CustomTextField(
//                 textEditingController: tEController,
//                 hintText: "e.g.,Fix leaking kitchen tap",
//                 hintTextColor: Color(0xff6B7280),
//               ),
//               SizedBox(height: 10),
//               CustomDropDownWidget(
//                 label: "Task Category",
//                 hint: "Select Category",
//                 items: ["Cleaning", "Delivery", "Tutoring", "Gardening"],
//                 onChanged: (value) {
//                   print("Selected: $value");
//                 },
//               ),
//               SizedBox(height: 20),
//               CustomButton(
//                 title: "Next ",
//                   width: 130,
//                   onTap: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>TaskDetails()));
//                   }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
