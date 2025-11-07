import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_alley/view/widgets/CustomAppBar.dart';
import '../../../../gen/assets.gen.dart';
import '../../../widgets/custom_button.dart';
import 'budget.dart';

class DateTimeScreen2 extends StatefulWidget {
  const DateTimeScreen2({super.key});

  @override
  State<DateTimeScreen2> createState() => _DateTimeScreen2State();
}

class _DateTimeScreen2State extends State<DateTimeScreen2> {
  final _formKey = GlobalKey<FormState>();

  int? selectedIndex;
  int? selectIndex;

  final List<String> options = ["In Person", "Online"];
  final List<String> option = ["Fixed Date", "Flexible"];

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


    print('Title: $title');
    print('Category: $category');
    print('Description: $description');
    print('Image: $imagePath');
    print('taskDone: $taskDone');
    print('locationController: $locationController');
    print('whenTaskDone: $whenTaskDone');
    print('selectedDate: $selectedDate');
    print('selectedTime: $selectedTime');



    return Scaffold(
      appBar: CustomAppBar(
        title: "Post Task",
        onBack: () => Get.back(),
      ),
      body: Padding(
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
                    "Date & Time",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xff115E59),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              /// Question 1
              const Text(
                "How should the task be done?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),

              /// Option Buttons for "In Person" / "Online"
              Row(
                children: List.generate(
                  options.length,
                      (index) => Expanded(
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: index == 0 ? 15 : 0),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE6F4F1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: selectedIndex == index
                                ? const Color(0xFF115E59)
                                : Colors.transparent,
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              selectedIndex == index
                                  ? Icons.radio_button_checked_sharp
                                  : Icons.radio_button_off,
                              color: const Color(0xFF115E59),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              options[index],
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              /// Question 2
              const Text(
                "When do you want this task done?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),

              /// Option Buttons for "Fixed Date" / "Flexible"
              Row(
                children: List.generate(
                  option.length,
                      (index) => Expanded(
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          selectIndex = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: index == 0 ? 15 : 0),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE6F4F1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: selectIndex == index
                                ? const Color(0xFF115E59)
                                : Colors.transparent,
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              selectIndex == index
                                  ? Icons.radio_button_checked_sharp
                                  : Icons.radio_button_off,
                              color: const Color(0xFF115E59),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              option[index],
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.back(),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.teal, width: 1.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
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
                      title: "Next",
                      width: 130,
                      onTap: (){
                        final taskData = {
                          'title': title,
                          'category': category,
                          'description': description,
                          'image': imagePath,
                          'taskDone': taskDone,               // "In Person" or "Online"
                          'locationController': locationController,
                          'whenTaskDone': whenTaskDone,               // "Fixed Date" or "Flexible"
                          'selectedDate': selectedTime,     // convert DateTime to string
                          'selectedTime': selectedTime,
                          "hTaskDone": selectedIndex != null ? options[selectedIndex!] : null,
                          "wTaskDone": selectIndex != null ? option[selectIndex!] : null,

                        };

                        Get.to(
                          const Budget(),
                          arguments: taskData,
                        );
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














// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:task_alley/view/widgets/CustomAppBar.dart';
// import '../../../../gen/assets.gen.dart';
// import '../../../widgets/custom_button.dart';
// import 'budget.dart';
//
// class DateTimeScreen2 extends StatefulWidget {
//   const DateTimeScreen2({super.key});
//
//   @override
//   State<DateTimeScreen2> createState() => _DateTimeScreen2State();
// }
//
// class _DateTimeScreen2State extends State<DateTimeScreen2> {
//   int selectedIndex = 0;
//   int selectIndex = 0;
//
//   DateTime? selectedDate;
//   TimeOfDay? selectedTime;
//
//   final List<String> options = ["In Person", "Online"];
//   final List<String> option = ["Fixed Date", " Flexible"];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: "Post Task",
//         onBack: () {},
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             /// Header
//             Row(
//               children: [
//                 Image.asset(
//                   Assets.icons.postTask.path,
//                   height: 18,
//                   width: 18,
//                   color: const Color(0xff115E59),
//                 ),
//                 const SizedBox(width: 10),
//                 const Text(
//                   "Date & Time",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 16,
//                     color: Color(0xff115E59),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//
//             /// Question
//             const Text(
//               "How should the task be done?",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 14,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//
//             const SizedBox(height: 10),
//
//             /// Option Buttons
//             Row(
//               children: List.generate(
//                 options.length,
//                     (index) => Expanded(
//                   child: InkWell(
//                     splashColor: Colors.transparent,
//                     highlightColor: Colors.transparent,
//                     onTap: () {
//                       setState(() {
//                         selectedIndex = index;
//                       });
//                     },
//
//                     child: Container(
//                       margin: EdgeInsets.only(right: index == 0 ? 15 : 0),
//                       padding: const EdgeInsets.symmetric(vertical: 10),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFFE6F4F1),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             selectedIndex == index
//                                 ? Icons.radio_button_checked_sharp
//                                 : Icons.radio_button_off,
//                             color: const Color(0xFF115E59),
//                           ),
//                           const SizedBox(width: 20),
//                           Text(
//                             options[index], // Different label per option
//                             style: const TextStyle(
//                               color: Colors.grey,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             const Text(
//               "When do you want this task done?",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 14,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Row(
//               children: List.generate(
//                 option.length,
//                     (index) => Expanded(
//                   child: InkWell(
//                     splashColor: Colors.transparent,
//                     highlightColor: Colors.transparent,
//                     onTap: () {
//                       setState(() {
//                         selectIndex = index;
//                       });
//                     },
//
//                     child: Container(
//                       margin: EdgeInsets.only(right: 5),
//                       // margin: EdgeInsets.only(right: index == 0 ? 15 : 0),
//                       padding: const EdgeInsets.symmetric(vertical: 10),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFFE6F4F1),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             selectIndex == index
//                                 ? Icons.radio_button_checked_sharp
//                                 : Icons.radio_button_off,
//                             color: const Color(0xFF115E59),
//                           ),
//                           const SizedBox(width: 20),
//                           Text(
//                             option[index], // Different label per option
//                             style: const TextStyle(
//                               color: Colors.grey,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 15,),
//             Row(
//               children: [
//                 Expanded(
//                   child: OutlinedButton(
//                     onPressed: () {
//                     },
//                     style: OutlinedButton.styleFrom(
//                       side: const BorderSide(color: Colors.teal, width: 1.5),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                     ),
//                     child: const Text(
//                       "Previous",
//                       style: TextStyle(
//                         color: Colors.teal,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),),
//                 SizedBox(width: 15,),
//                 Expanded(
//                   child: CustomButton(
//                       title: "Next ",
//                       width: 130,
//                       onTap: () {
//                    Get.to(Budget());
//                       }),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
