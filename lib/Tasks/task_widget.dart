import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase_utils.dart';
import 'package:todo_app/my_theme.dart';
import 'package:todo_app/provider/app_provider.dart';

import '../model/task.dart';

class TaskWidget extends StatelessWidget {
  Task task;

  TaskWidget({required this.task});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Slidable(
      startActionPane: ActionPane(
        extentRatio: 0.35,
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            borderRadius: BorderRadius.circular(45),
            spacing: 4,
            onPressed: (BuildContext context) {
              deleteTaskFromFireStore(task).timeout(Duration(milliseconds: 500),
                  onTimeout: () => provider.getAllTasksFromFireStore());
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8),
                  color: task.isDone
                      ? MyTheme.greenColor
                      : MyTheme.primaryBlueColor,
                  width: 2,
                  height: 80,
                ),
                Column(
                  children: [
                    Text(
                      task.title,
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                          color: task.isDone
                              ? MyTheme.greenColor
                              : MyTheme.primaryBlueColor,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      task.description,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(color: Colors.black, fontSize: 16),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    task.isDone
                        ? Text('DONE!',
                            style: TextStyle(
                                color: MyTheme.greenColor, fontSize: 16))
                        : Text(""),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                updateTaskToFireStore(task).timeout(
                    Duration(
                      milliseconds: 500,
                    ),
                    onTimeout: () => provider.getAllTasksFromFireStore());
              },
              child: Icon(
                Icons.check,
                size: 30,
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: task.isDone
                      ? MyTheme.greenColor
                      : MyTheme.primaryBlueColor),
            )
          ],
        ),
      ),
    );
  }
}
