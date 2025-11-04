import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../widgets/custom_text.dart';
import '../widget/notification_card.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Map<String, String>> notifications = [
    {
      "title": "Task Accepted",
      "desc": "Good news! Your task has been accepted by Aminul. You'll be notified as the task progresses.",
      "img": "https://i.pravatar.cc/100?img=1"
    },
    {
      "title": "New Message",
      "desc": "You have a new message from Sarah regarding your task. Tap to open the chat and reply.",
      "img": "https://i.pravatar.cc/100?img=2"
    },
    {
      "title": "Question Received",
      "desc": "A Tasker has a question about your task. Check task details and reply to keep things moving.",
      "img": "https://i.pravatar.cc/100?img=3"
    },
    {
      "title": "Task Marked as Complete",
      "desc": "Your task with Rahim has been marked as completed. Don’t forget to leave a review!",
      "img": "https://i.pravatar.cc/100?img=4"
    },
    {
      "title": "Offer Received",
      "desc": "You’ve received a new offer from Jamal. Review it and decide whether to accept or decline.",
      "img": "https://i.pravatar.cc/100?img=5"
    },
  ];

  void markAllRead() {
    setState(() {
      notifications.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back button
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_back_ios_new, size: 18),
                    ),
                  ),
                  CustomText(
                    text: "Notification",
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                  InkWell(
                    onTap: markAllRead,
                    child: CustomText(
                      text: "Mark All Read",
                      color: AppColors.green,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),

              // List of notifications
              Expanded(
                child: ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    final item = notifications[index];
                    return NotificationCard(
                      title: item["title"]!,
                      description: item["desc"]!,
                      imageUrl: item["img"]!,
                      onClose: () {
                        setState(() {
                          notifications.removeAt(index);
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
