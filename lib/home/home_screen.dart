import 'package:flutter/material.dart';
import 'package:todo_app/Tasks/add_task_bottom_sheet.dart';
import 'package:todo_app/Tasks/tasks_tab.dart';
import 'package:todo_app/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [TasksTab(), SettingsTab()];
  var titles = ['To Do List', 'Settings'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[selectedIndex]),
      ),
      body: tabs[selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 8,
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.list, size: 30), label: 'Tasks'),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings_suggest_outlined,
                  size: 30,
                ),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddBottomSheet();
        },
        child: Icon(Icons.add, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void showAddBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => AddTaskBottomSheet());
  }
}
