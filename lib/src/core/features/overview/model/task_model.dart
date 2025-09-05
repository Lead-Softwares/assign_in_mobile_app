import 'package:assign_in/src/core/features/overview/enums/task_priority.dart';
import 'package:flutter/material.dart';

class TaskModel {
  final String id;
  final String title;
  final DateTime date;
  final DateTime time;
  final IconData? icon;
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
        id: '$i',
        title: 'Todo Task name',
        date: DateTime.now().add(Duration(days: i)),
        time: DateTime.now().add(const Duration(hours: 5)),
        icon: Icons.pending_actions,
        status: TaskStatus.todo,
        taskPriority: i % 2 == 0 ? TaskPriority.medium : TaskPriority.low,
      ),

    for (int i = 1; i <= 10; i++)
      TaskModel(
        id: '$i',
        title: 'Progress Task ',
        date: DateTime.now().add(Duration(days: i + 15)),
        time: DateTime.now().add(const Duration(hours: 2)),
        icon: Icons.work_history,
        status: TaskStatus.progress,
        taskPriority: i % 3 == 0 ? TaskPriority.medium : TaskPriority.low,
      ),

    for (int i = 1; i <= 5; i++)
      TaskModel(
        id: 'completed_$i',
        title: 'Completed Task ',
        date: DateTime.now().subtract(Duration(days: i)),
        time: DateTime.now().add(const Duration(hours: 4)),
        status: TaskStatus.completed,
        taskPriority: i.isEven ? TaskPriority.medium : TaskPriority.low,
        icon: null,
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
