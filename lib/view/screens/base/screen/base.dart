import 'package:flutter/material.dart';
import '../../../customer/home/screens/home/home_screen.dart';
import '../../chat/screen/MessagesPage.dart';
import '../../my_task/screen/my_task.dart';
import '../../post_task/screen/post_task_screen.dart';
import '../../profile/screen/profile/screen/profile_screen.dart';
import '../widget/CustomBottomNavBar.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    CustomerHomeScreen(),
    MyTask(),
    PostTaskScreen(),
    MessagesPage(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
