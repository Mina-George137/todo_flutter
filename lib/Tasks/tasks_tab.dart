import 'package:flutter/material.dart';
import 'package:todo_app/Tasks/task_widget.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return const TaskWidget();
              },
              itemCount: 20,
            ),
          )
        ],
      ),
    );
  }
}
