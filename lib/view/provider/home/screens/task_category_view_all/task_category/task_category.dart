import 'package:flutter/material.dart';

import '../widget/category_card.dart';

class TaskCategory extends StatelessWidget {
  const TaskCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "Tasks Categories",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, size: 18, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 3,
                mainAxisSpacing: 5
            ),
            itemBuilder: (context, index){
               return CategoryCard(
                   icon: Icons.account_box, title: 'hello', providers: 200,

               );
            }),
      ),
    )

    );
  }
}
