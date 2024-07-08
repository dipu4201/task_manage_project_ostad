import 'package:flutter/material.dart';
import 'package:task_manage_1_project/ui/widget/background_widget.dart';
import 'package:task_manage_1_project/ui/widget/profile_app_bar.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {

  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _discriptionTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context),
      body: BackgroundWidget(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  controller: _titleTEController,
                  decoration: InputDecoration(
                    hintText: 'Title'
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _discriptionTEController,
                  maxLines: 4,
                  decoration: InputDecoration(
                      hintText: 'Discription'
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Add'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _titleTEController.dispose();
    _discriptionTEController.dispose();
    super.dispose();
  }
}
