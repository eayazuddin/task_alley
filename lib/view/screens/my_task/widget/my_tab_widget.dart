import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_alley/view/screens/my_task/widget/task_card_screen.dart';
import '../controller/task_controller.dart';


class StatusWidgetView extends GetView<TaskController> {
  const StatusWidgetView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TaskController());

    final List<String> statusText = [
      'All Tasks',
      'Open for bids',
      'In Progress',
      'Completed',
      'Cancelled',
    ];

    return DefaultTabController(
      length: statusText.length,
      child: Builder(
        builder: (context) {
          final TabController tabController = DefaultTabController.of(context);

          /// Swipe listener (instant color update)
          tabController.animation!.addListener(() {
            final int currentIndex = tabController.animation!.value.round();
            if (controller.selectedStatus.value != currentIndex) {
              controller.selectedStatus.value = currentIndex;
            }
          });

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Custom Status TabBar
              Obx(
                () => TabBar(
                  controller: tabController,
                  tabAlignment: TabAlignment.center,
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  dividerColor: Colors.transparent,
                  labelPadding: EdgeInsets.zero,
                  enableFeedback: false,
                  onTap: (value) => controller.selectedStatus.value = value,
                  splashFactory: NoSplash.splashFactory,
                  tabs: List.generate(statusText.length, (index) {
                    final bool isSelected = controller.selectedStatus.value == index;
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xff115E59) : const Color(0xffE6F4F1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          statusText[index],
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 16.h),

              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: EdgeInsetsGeometry.only(bottom: 10),
                    child: TabBarView(
                      controller: tabController,
                      physics: const ClampingScrollPhysics(),
                      children: [
                        // TaskCardScreen(),
                        TaskCardScreen(),
                        // TaskCardScreen(),
                        // TaskCardScreen(),
                        // TaskCardScreen()
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
