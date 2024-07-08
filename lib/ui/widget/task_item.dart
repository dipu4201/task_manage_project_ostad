import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: ListTile(
        title: const Text('Title Will Be Hare'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Discription Will be hare'),
            const Text(
              'Date: 12/12/24',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: const Text('New'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                ),
                ButtonBar(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete_forever),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
