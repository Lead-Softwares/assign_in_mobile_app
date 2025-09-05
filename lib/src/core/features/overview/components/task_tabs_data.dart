import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/components/general_container.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:assign_in/src/core/features/overview/components/recent_projects.dart';
import 'package:assign_in/src/core/features/overview/model/task_model.dart';
import 'package:assign_in/src/utils/time_utils.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

class TaskTabsData extends StatefulWidget {
  const TaskTabsData({super.key});

  @override
  State<TaskTabsData> createState() => _TaskTabsDataState();
}

class _TaskTabsDataState extends State<TaskTabsData>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final todoTasks = TaskModel.staticData
    //     .where((t) => t.status == TaskStatus.todo)
    //     .toList();
    // final progressTasks = TaskModel.staticData
    //     .where((t) => t.status == TaskStatus.progress)
    //     .toList();
    // final completedTasks = TaskModel.staticData
    //     .where((t) => t.status == TaskStatus.completed)
    //     .toList();
    final todoTasks =
        TaskModel.staticData.where((t) => t.status == TaskStatus.todo).toList()
          ..sort(
            (a, b) => a.taskPriority.order.compareTo(b.taskPriority.order),
          );

    final progressTasks =
        TaskModel.staticData
            .where((t) => t.status == TaskStatus.progress)
            .toList()
          ..sort(
            (a, b) => a.taskPriority.order.compareTo(b.taskPriority.order),
          );

    final completedTasks =
        TaskModel.staticData
            .where((t) => t.status == TaskStatus.completed)
            .toList()
          ..sort(
            (a, b) => a.taskPriority.order.compareTo(b.taskPriority.order),
          );

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: myPadding / 2),
          height: 40,
          child: ButtonsTabBar(
            controller: _controller,
            backgroundColor: MyColors.primaryColor,
            unselectedBackgroundColor: Colors.grey.shade200,
            unselectedLabelStyle: const TextStyle(color: Colors.black87),
            labelStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
            contentCenter: true,
            buttonMargin: const EdgeInsets.only(right: 30),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            borderWidth: 1,
            borderColor: Colors.transparent,
            radius: 8,
            width: context.width / 3,
            tabs: [
              Tab(text: 'To do (${todoTasks.length})'),
              const Tab(text: 'Progress'),
              const Tab(text: 'Completed'),
            ],
          ),
        ),
        const SizedBox(height: 10),

        SizedBox(
          height: context.height * 2.2,
          child: TabBarView(
            controller: _controller,
            children: [
              _taskData(todoTasks),
              _taskData(progressTasks),
              _taskData(completedTasks),
            ],
          ),
        ),
      ],
    );
  }

  Widget _taskData(List<TaskModel> tasks) {
    if (tasks.isEmpty) {
      return const Center(child: Text('No tasks available'));
    }

    return ReorderableListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: tasks.length,
      onReorder: (oldIndex, newIndex) {
        setState(() {
          if (newIndex > oldIndex) newIndex -= 1;
          final task = tasks.removeAt(oldIndex);
          tasks.insert(newIndex, task);
        });
      },
      itemBuilder: (context, index) {
        final task = tasks[index];
        return TaskCard(key: ValueKey(task.id), taskModel: task, index: index);
      },
    );
  }
}

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.taskModel, required this.index});

  final TaskModel taskModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GeneralContainer(
      key: key,
      padding: const EdgeInsets.symmetric(
        horizontal: myPadding / 2,
        vertical: myPadding / 1.2,
      ),
      margin: const EdgeInsets.all(myPadding / 2),
      height: 90,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade200,
          blurRadius: 10,
          spreadRadius: 3,
          offset: const Offset(3, 3),
        ),
      ],
      child: Row(
        children: [
          Icon(
            taskModel.status == TaskStatus.completed
                ? Icons.check_circle
                : Icons.check_circle_outline,
            color: taskModel.status == TaskStatus.completed
                ? Colors.green
                : Colors.grey.shade400,
          ),
          // Icon(Icons.check_circle_outline, color: Colors.grey.shade400),
          const SizedBox(width: myPadding / 1.5),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${TimeUtils.convertDateFormat(taskModel.date)} ${TimeUtils.convertTimeFormat(taskModel.time)}',

                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey.shade500,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: myPadding / 2),
                Text(
                  taskModel.title,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: myPadding * 2),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ReorderableDragStartListener(
                  index: index,
                  child: const Icon(Icons.drag_indicator, color: Colors.grey),
                ),
                BadgeContainer(
                  color: Colors.red.shade50,
                  child: Row(
                    children: [
                      Icon(Icons.flag, color: Colors.red.shade500, size: 18),
                      const SizedBox(width: myPadding / 4),
                      Text(
                        taskModel.taskPriority.name,
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
