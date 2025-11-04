import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_alley/gen/assets.gen.dart';
import 'package:task_alley/view/widgets/custom_text.dart';
import '../../widget/app_bar/header_section.dart';
import '../../widget/category/category_item.dart';
import '../../widget/popular_task/service_card.dart';
import '../../widget/recently_added_card/task_card.dart';
import '../../widget/search/custom_search_bar.dart';
import '../../widget/section_header/section_header.dart';
import '../popular_sevice_all/popular_service_all.dart';
import '../recently_added_all/recently_added.dart';
import '../service_details/screen/service_details.dart';
import '../task_category_view_all/task_category/task_category.dart';
import '../task_details/task_details/screen/task_details.dart';

class ProviderHomeScreen extends StatefulWidget {
  const ProviderHomeScreen({super.key});

  @override
  State<ProviderHomeScreen> createState() => _ProviderHomeScreenState();
}
class _ProviderHomeScreenState extends State<ProviderHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderSection(
                  userName: 'Mojahid',
                  welcomeText: 'Welcome to TaskAlley',
                  profileImageUrl: 'https://i.pravatar.cc/300',
                ),
                const CustomSearchBar(hintText: "Search for services..."),
                SectionHeader(
                  title: "My Stats",
                  viewAllColor: Colors.blueAccent,
                  showViewAll: false,
                ),
                SizedBox(
                  height: 360,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.only(
                          top: 30,left: 20
                        ),
                        margin:EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                        height: 145,
                        width: 169,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(image: AssetImage(Assets.images.stateCardBack.path),fit: BoxFit.cover)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Total Tasks Completed",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xff6B7280)
                            ),),
                            Text("123",style: TextStyle(
                              color: Color(0xff115E59),
                              fontSize: 32,
                              fontWeight: FontWeight.w600
                            ),)
                          ],
                        )
                      );
                    },
                  ),
                ),
                SectionHeader(
                  title: "Categories",
                  viewAllColor: Colors.blueAccent,
                  onViewAll: () {
                    Get.to(const TaskCategory());
                  },
                ),
                SizedBox(
                  height: 250.h,
                  child: GridView.builder(
                    padding: const EdgeInsets.only(top: 10),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 8,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.8,
                        ),
                    itemBuilder: (context, index) {
                      return CategoryItem(
                        title: "Cleaning",
                        imageUrl:
                            "https://gimgs2.nohat.cc/thumb/f/640/cleaner-with-cleaning-products-housekeeping-service-free-vector--bb3af4a57f2441d1b680.jpg",
                        onTap: () {
                          Get.to(const RecentlyAdded());
                        },
                      );
                    },
                  ),
                ),
                SectionHeader(
                  title: "Recently added tasks",
                  viewAllColor: Colors.blueAccent,
                  onViewAll: () {
                    Get.to(RecentlyAdded());
                  },
                ),
                SizedBox(
                  height: 400.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount: 2,
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
                        onTap: () {
                          Get.to(TaskDetailsScreen());
                        },
                      );
                    },
                  ),
                ),
                SectionHeader(
                  title: "Popular Services",
                  viewAllColor: Colors.blueAccent,
                  onViewAll: () {
                    Get.to(PopularServiceAll());
                  },
                ),
                SizedBox(
                  height: 700.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return ServiceCard(
                        category: "Cleaning",
                        imageUrl:
                            "https://images.unsplash.com/photo-1760029012684-7cc3800aba71?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw2fHx8ZW58MHx8fHx8&auto=format&fit=crop&q=60&w=500",
                        location: "New York, USA",
                        rating: 4.5,
                        title: "Office Cleaning Service From",
                        price: 24.00,
                        oldPrice: 32.00,
                        onBookNow: () {
                          Get.to(ServiceDetails());
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
