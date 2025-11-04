import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widget/recently_added_card/task_card.dart';

class RecentlyAdded extends StatefulWidget {
  const RecentlyAdded({super.key});

  @override
  State<RecentlyAdded> createState() => _RecentlyAddedState();
}

class _RecentlyAddedState extends State<RecentlyAdded> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: 800.h,
        child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          // physics: NeverScrollableScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, index) {
            return TaskCard(
              title: "Help move a couch",
              price: 24.00,
              fromLocation: "Los Angeles CA 90024",
              toLocation: "New York, USA",
              dateTime: "15 May 2020 8:00 am",
              userName: "Marvin Fey",
              userImage:
              "https://images.unsplash.com/photo-1607746882042-944635dfe10e?auto=format&fit=crop&w=200&q=80",
              status: "Open",
              offerCount: "1",
              // onTap: () {
              //  // Get.to(TaskDetailsScreen(),
              //   );
              // },
            );
          },
        ),
      ),
    );
  }
}
