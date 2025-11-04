import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task_alley/view/widgets/CustomAppBar.dart';
import 'package:task_alley/view/widgets/custom_text_field.dart';
import '../../../../gen/assets.gen.dart';
import '../../../widgets/custom_button.dart';
import 'date_time_screen_2.dart';

class DateAndTime extends StatefulWidget {
  const DateAndTime({super.key});

  @override
  State<DateAndTime> createState() => _DateAndTimeState();
}

class _DateAndTimeState extends State<DateAndTime> {
  int selectedIndex = 0;
  int selectIndex = 0;

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  final List<String> options = ["In Person", "Online"];
  final List<String> option = ["Fixed Date", " Flexible"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Post Task",
        onBack: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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

            /// Question
            const Text(
              "How should the task be done?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 10),

            /// Option Buttons
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
                            options[index], // Different label per option
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
            const SizedBox(height: 10),
            const Text(
              "Where to Go to Complete the Task",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 10),
            CustomTextField(
              hintText: "e.g., 123 Allen Avenue, Ikeja, Lagos, 100001	",
            ),
            const SizedBox(height: 10),
            const Text(
              "When do you want this task done?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
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
                      margin: EdgeInsets.only(right: 5),
                      // margin: EdgeInsets.only(right: index == 0 ? 15 : 0),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE6F4F1),
                        borderRadius: BorderRadius.circular(10),
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
                            option[index], // Different label per option
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
            /// Preferred Date Label
            const Text(
              "Preferred Date",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 6),

            /// Date Field
            GestureDetector(
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2100),
                );
                if (date != null) {
                  setState(() {
                    selectedDate = date;
                  });
                }
              },
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6F4F1), // mint background
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedDate == null
                          ? "Select date"
                          : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                      style: const TextStyle(
                        color: Color(0xFF6B7280), // gray text
                        fontSize: 14,
                      ),
                    ),
                    const Icon(
                      Icons.calendar_today_outlined,
                      color: Color(0xFF374151), // dark gray icon
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Preferred Time Label
            const Text(
              "Preferred Time",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 6),

            /// Time Field
            GestureDetector(
              onTap: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {
                  setState(() {
                    selectedTime = time;
                  });
                }
              },
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6F4F1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedTime == null
                          ? "Select time"
                          : selectedTime!.format(context),
                      style: const TextStyle(
                        color: Color(0xFF6B7280),
                        fontSize: 14,
                      ),
                    ),
                    const Icon(
                      Icons.access_time_outlined,
                      color: Color(0xFF374151),
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {

                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.teal, width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: const Text(
                      "Previous",
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),),
                SizedBox(width: 15,),
                Expanded(
                  child: CustomButton(
                      title: "Next ",
                      width: 130,
                      onTap: () {
                       Get.to(DateTimeScreen2());
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
