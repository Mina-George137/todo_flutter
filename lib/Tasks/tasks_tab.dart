import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Tasks/task_widget.dart';
import 'package:todo_app/my_theme.dart';
import 'package:todo_app/provider/app_provider.dart';

class TasksTab extends StatefulWidget {
  TasksTab({Key? key}) : super(key: key);

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    if (provider.taskList.isEmpty) {
      provider.getAllTasksFromFireStore();
    }
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CalendarTimeline(
              initialDate: provider.selectedDate,
              firstDate: DateTime.now().subtract(Duration(days: 365)),
              lastDate: DateTime.now().add(Duration(days: 365)),
              onDateSelected: (date) {
                provider.setNewSelectedDate(date);
              },
              leftMargin: 20,
              monthColor: MyTheme.primaryBlueColor,
              dayColor: MyTheme.primaryBlueColor,
              activeDayColor: MyTheme.primaryBlueColor,
              activeBackgroundDayColor: Colors.white,
              dotsColor: MyTheme.primaryBlueColor,
              selectableDayPredicate: (date) => true,
              locale: 'en_ISO',
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return TaskWidget(
                  task: provider.taskList[index],
                );
              },
              itemCount: provider.taskList.length,
            ),
          )
        ],
      ),
    );
  }
}
