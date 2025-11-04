import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widget/popular_task/service_card.dart';

class PopularServiceAll extends StatefulWidget {
  const PopularServiceAll({super.key});

  @override
  State<PopularServiceAll> createState() => _PopularServiceAllState();
}

class _PopularServiceAllState extends State<PopularServiceAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: 700.h,
        child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          // physics: NeverScrollableScrollPhysics(),
          itemCount: 4,
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
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Booked Cleaning Service"),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
