import 'package:flutter/material.dart';
import 'package:todo_app/my_theme.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                color: MyTheme.primaryBlueColor,
                width: 2,
                height: 80,
              ),
              Column(
                children: [
                  Text(
                    'Task Title',
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(color: MyTheme.primaryBlueColor),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(Icons.access_time_rounded),
                      Text(
                        'Task time',
                        style: Theme.of(context).textTheme.subtitle1,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: Icon(
              Icons.check,
              size: 30,
            ),
            style: ElevatedButton.styleFrom(primary: MyTheme.primaryBlueColor),
          )
        ],
      ),
    );
  }
}
