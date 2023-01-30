import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
            itemCount: taskData.tasks.length,
            itemBuilder: (context, index) {
              return TaskTile(
                isChecked: taskData.tasks[index].isDone,
                taskTitle: taskData.tasks[index].name,
                checkboxChange: (newValue) {
                  taskData.updateTask(taskData.tasks[index]);

                  // setState(() {
                  //   widget.tasks[index].doneChanged();
                  // });
                },
                ListTileDelete: () {
                  taskData.deleteTask(taskData.tasks[index]);
                },
              );
            });
      },
    );
    // return ListView(
    //   children: [
    //     TaskTile(
    //       taskTitle: tasks[0].name,
    //       isChecked: tasks[0].isDone,
    //     ),
    //     TaskTile(
    //       taskTitle: tasks[1].name,
    //       isChecked: tasks[1].isDone,
    //     ),
    //     TaskTile(
    //       taskTitle: tasks[2].name,
    //       isChecked: tasks[2].isDone,
    //     ),
    //   ],
    // );
  }
}
