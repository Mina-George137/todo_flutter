import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/model/task.dart';

import '../firebase_utils.dart';

class AppProvider extends ChangeNotifier {
  List<Task> taskList = [];
  DateTime selectedDate = DateTime.now();

  getAllTasksFromFireStore() async {
    QuerySnapshot<Task> querySnapshot = await getTaskCollection().get();
    taskList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();

    /// FILTER ON SELECTED DATE
    taskList = taskList.where((task) {
      DateTime taskDate = DateTime.fromMillisecondsSinceEpoch(task.date);
      if (taskDate.day == selectedDate.day &&
          taskDate.month == selectedDate.month &&
          taskDate.year == selectedDate.year) {
        return true;
      }
      return false;
    }).toList();

    /// SORT
    taskList.sort((Task t1, Task t2) {
      DateTime date1 = DateTime.fromMillisecondsSinceEpoch(t1.date);
      DateTime date2 = DateTime.fromMillisecondsSinceEpoch(t2.date);
      return date1.compareTo(date2);
    });

    notifyListeners();
  }

  void setNewSelectedDate(DateTime newDate) {
    selectedDate = newDate;
    getAllTasksFromFireStore();
  }
}
