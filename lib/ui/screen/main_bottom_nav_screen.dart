import 'package:flutter/material.dart';
import 'package:task_manage_1_project/ui/screen/cancel_task_screen.dart';
import 'package:task_manage_1_project/ui/screen/completed_task_screen.dart';
import 'package:task_manage_1_project/ui/screen/inpogress_task_screen.dart';
import 'package:task_manage_1_project/ui/screen/new_task_screen.dart';
import 'package:task_manage_1_project/ui/utility/app_colors.dart';
import 'package:task_manage_1_project/ui/widget/profile_app_bar.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _selectedIndex = 0;
  List<Widget> _screens = const [
    NewTaskScreen(),
    CompletedTaskScreen(),
    InProgressTaskScreen(),
    CancelTaskScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          _selectedIndex = index;
          if (mounted) {
            setState(() {});
          }
        },
        selectedItemColor: AppColors.themeColor,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline_sharp), label: 'New Task'),
          BottomNavigationBarItem(
              icon: Icon(Icons.done_outline), label: 'Completed'),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time_outlined), label: 'In Pogress'),
          BottomNavigationBarItem(icon: Icon(Icons.close), label: 'Cancelled'),
        ],
      ),
    );
  }

}
