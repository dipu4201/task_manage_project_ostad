import 'package:flutter/material.dart';
import 'package:task_manage_1_project/ui/widget/task_item.dart';

class CancelTaskScreen extends StatefulWidget {
  const CancelTaskScreen({super.key});

  @override
  State<CancelTaskScreen> createState() => _CancelTaskScreenState();
}

class _CancelTaskScreenState extends State<CancelTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          return const TaskItem();
        },
      ),
    );
  }
}
