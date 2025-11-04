import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_alley/view/screens/my_task/widget/task_card.dart';

class TaskCardScreen extends StatefulWidget {

  const TaskCardScreen({super.key});

  @override
  State<TaskCardScreen> createState() => _TaskCardScreenState();
}

class _TaskCardScreenState extends State<TaskCardScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: 7,
      itemBuilder: (context, index) {
        return TaskCardTab(
          title: "Help move a couch",
          price: 24.00,
          fromLocation: "Los Angeles CA 90024",
          toLocation: "New York, USA",
          dateTime: "15 May 2020 8:00 am",
          userName: "Marvin Fey",
          userImage: "https://images.unsplash.com/photo-1607746882042-944635dfe10e?auto=format&fit=crop&w=200&q=80",
          status: "Open",
          offerCount: "1",
          onTap: (){
               Get.to(());
          },
        );
      },
    );
  }
}
