import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            children: [
              Text('Add new task',
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(fontSize: 20)),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    maxLength: 1,
                    decoration: InputDecoration(labelText: 'Enter task title'),
                  ),
                  TextFormField(
                    maxLength: 5,
                    decoration:
                        InputDecoration(labelText: 'Enter task description'),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Select Time',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '1/8/2023',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              )),
              SizedBox(
                height: 8,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Add task', style: TextStyle(fontSize: 18)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
