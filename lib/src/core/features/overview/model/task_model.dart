import 'package:assign_in/src/core/features/overview/model/task_priority.dart';
import 'package:flutter/material.dart';

class TaskModel {
  final String id;
  final String title;
  final DateTime date;
  final String time;
  final IconData icon;
  final TaskStatus status;
  final TaskPriority taskPriority;

  TaskModel({
    required this.id,
    required this.title,
    required this.date,
    required this.time,
    required this.icon,
    required this.status,
    required this.taskPriority,
  });

  static final List<TaskModel> staticData = [
    for (int i = 1; i <= 15; i++)
      TaskModel(
        id: 'todo_$i',
        title: 'Todo Task $i',
        date: DateTime.now().add(Duration(days: i)),
        time: '${9 + (i % 5)}:00 AM',
        icon: Icons.pending_actions,
        status: TaskStatus.todo,
        taskPriority: i % 2 == 0 ? TaskPriority.medium : TaskPriority.low,
      ),

    for (int i = 1; i <= 10; i++)
      TaskModel(
        id: 'progress_$i',
        title: 'Progress Task $i',
        date: DateTime.now().add(Duration(days: i + 15)),
        time: '${10 + (i % 4)}:30 AM',
        icon: Icons.work_history,
        status: TaskStatus.progress,
        taskPriority: i % 3 == 0 ? TaskPriority.medium : TaskPriority.low,
      ),

    for (int i = 1; i <= 5; i++)
      TaskModel(
        id: 'completed_$i',
        title: 'Completed Task $i',
        date: DateTime.now().subtract(Duration(days: i)),
        time: '${2 + (i % 3)}:45 PM',
        icon: Icons.check_circle,
        status: TaskStatus.completed,
        taskPriority: i.isEven ? TaskPriority.medium : TaskPriority.low,
      ),
  ];
}

enum TaskStatus {
  todo,
  progress,
  completed;

  String get key => switch (this) {
    todo => 'todo',
    progress => 'progress',
    completed => 'completed',
  };
}
