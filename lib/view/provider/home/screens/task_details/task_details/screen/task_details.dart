import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/AskQuestionBox.dart';
import '../widget/PostedByCard.dart';
import '../widget/ReviewCard.dart';
import '../widget/TaskBudgetCard.dart';
import '../widget/question_card.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({super.key});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  var selectedIndex = 0;
  List<String> textTab = ['Bids', "Questions"];
  TextEditingController tEcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "My Tasks Details",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Button
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text(
                "Open for Bids",
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Title
            const Text(
              "Help move a couch",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            const Text("Task ID #1233", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 15),

            // Posted By
            const PostedByCard(
              imageUrl:
                  "https://i.fbcd.co/products/resized/resized-750-500/d4c961732ba6ec52c0bbde63c9cb9e5dd6593826ee788080599f68920224e27d.webp",
              name: 'Marvin Fey',
            ),
            const SizedBox(height: 20),

            // Location
            const Row(
              children: [
                Icon(Icons.location_on_outlined, color: Colors.teal, size: 28),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Location",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "New York, USA",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(
                  Icons.calendar_month_outlined,
                  color: Colors.teal,
                  size: 28,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "To Be Done On",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "15 May 2020 8:00 am",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Details
            const Text(
              "Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              "I'm after 2 palettes that are sold out online but available from 2 specific stores. They need to be sent out to you in the US and then forwarded to me in Sydney in 1 package for convenience. For more information please direct message me! Paid!",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black87,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 10),
            const Divider(color: Color(0xffE5E7EB)),

            // Budget Card
            TaskBudgetCard(amount: 24.00, onSubmit: () {}),
            const Divider(color: Color(0xffE5E7EB)),
            const SizedBox(height: 10),

            // Tabs
            Row(
              children: List.generate(textTab.length, (index) {
                return InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 120.w,
                    margin: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? const Color(0xFF115E59)
                          : const Color(0xFF115E59).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        textTab[index],
                        style: TextStyle(
                          color: selectedIndex == index
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),

            // Tab content (no spread operator)
            if (selectedIndex == 0)
              SizedBox(
                height: 800,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReviewCard(
                      imageUrl:
                          'https://randomuser.me/api/portraits/women/65.jpg',
                      name: 'Grace Carey',
                      rating: 4.5,
                      reviewCount: '149',
                      reviewText:
                          'I was a bit nervous to be buying a secondhand phone from Amazon, but I couldn’t be happier with my purchase! I have a pre-paid data plan so I was worried that this phone wouldn’t connect with my data plan, since the new phones don’t have the physical Sim tray anymore.',
                      date: '24 January, 2023',
                    ),
                    ReviewCard(
                      imageUrl:
                          'https://randomuser.me/api/portraits/men/72.jpg',
                      name: 'John Smith',
                      rating: 4.8,
                      reviewCount: '201',
                      reviewText:
                          'Fantastic experience! The phone arrived in perfect condition and worked instantly with my carrier.',
                      date: '12 February, 2024',
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12),
                        Align(
                          alignment: Alignment.topLeft,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF0E7C5F),
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "View More",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            else if (selectedIndex == 1)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  AskQuestionBox(
                    controller: tEcontroller, onSend: () {  }, onImagePick: () {  },),
                  question_card(
                      imageUrl:  'https://randomuser.me/api/portraits/men/72.jpg',
                      name: 'Ronald Richards',
                      comment: 'I was a bit nervous to be buying a secondhand phone from Amazon,'
                          ' but I couldn’t be happier with my purchase!! I have '
                          'a pre-paid data plan so I was worried that this phone wouldn’t '
                          'connect with my data plan, since the new phones don’t have the physical Sim tray anymore.',
                      date: '24 January,2023'),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.topLeft,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0E7C5F),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "View More",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
