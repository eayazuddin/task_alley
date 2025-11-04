import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/task_controller.dart';
import '../widget/my_tab_widget.dart';

class MyTask extends StatelessWidget {
  const MyTask({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TaskController());
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(style: ButtonStyle(
        ),
          onPressed: (){

          },
        ),
        title: Text("My Task"),
      ),
      body:  StatusWidgetView(),
    );
  }
}
