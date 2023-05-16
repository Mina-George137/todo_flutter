import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase_utils.dart';
import 'package:todo_app/model/task.dart';

import '../provider/app_provider.dart';

class AddTaskBottomSheet extends StatefulWidget {
  AddTaskBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  String title = '';

  String description = '';

  DateTime selectedDate = DateTime.now();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    return Container(
      margin: EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Text('Add new task',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(color: Colors.black)),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (text) => title = text,
                        maxLines: 1,
                        style: TextStyle(fontSize: 20, color: Colors.black),
                        decoration: InputDecoration(
                          helperText: 'Enter task title',
                        ),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "Please enter task title";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        style: TextStyle(fontSize: 12, color: Colors.black),
                        maxLines: 5,
                        onChanged: (text) => description = text,
                        decoration: InputDecoration(
                          helperText: 'Enter task description',
                        ),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "Please enter task description";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Select Time',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: chooseTaskDate,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  addTask();
                  provider.getAllTasksFromFireStore();
                },
                child: Text('Add task', style: TextStyle(fontSize: 18)),
              )
            ],
          ),
        ),
      ),
    );
  }

  void chooseTaskDate() async {
    var choosenDay = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365 * 10)));

    if (choosenDay != null) {
      selectedDate = choosenDay;
      setState(() {});
    }
  }

  void addTask() {
    if (formKey.currentState!.validate() == true) {
      Task task = Task(
          title: title,
          description: description,
          date: selectedDate.millisecondsSinceEpoch);
      addTaskToFireStore(task).timeout(Duration(milliseconds: 500),
          onTimeout: () {
        print("task added");
        Navigator.pop(context);
      });
    }
  }
}
