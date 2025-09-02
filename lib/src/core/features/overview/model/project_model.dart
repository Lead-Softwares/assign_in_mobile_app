import 'package:flutter/material.dart';

class ProjectModel {
  final String category;
  final String title;
  final String decription;
  final int comments;
  final DateTime date;
  final Color color;
  final List<String> images;
  ProjectModel({
    required this.category,
    required this.title,
    required this.color,
    required this.decription,
    required this.comments,
    required this.date,
    required this.images,
  });

  static final List<ProjectModel> projectData = [
    ProjectModel(
      color: const Color(0xFFdcff40),
      category: 'Designing',
      title: 'App UI/Ux Design and interface',
      decription:
          'Lorum ipsum this is the dummy text, project description here',
      comments: 2,
      date: DateTime(DateTime.december),
      images: [
        'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
        'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdHoEvVXwwHJQEFlclzVc_wrEELWYQEbd6mw&s',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdHoEvVXwwHJQEFlclzVc_wrEELWYQEbd6mw&s',
      ],
    ),

    ProjectModel(
      color: const Color(0xFF9de2ff),
      title: 'App UI/Ux Design and interface',
      decription:
          'Lorum ipsum this is the dummy text, project description here',
      comments: 2,
      date: DateTime(DateTime.december),
      images: [
        'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
        'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdHoEvVXwwHJQEFlclzVc_wrEELWYQEbd6mw&s',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdHoEvVXwwHJQEFlclzVc_wrEELWYQEbd6mw&s',
      ],
      category: 'Development',
    ),
    ProjectModel(
      color: const Color(0xFfb4e3ff),
      category: 'Graphics',
      title: 'App UI/Ux Design and interface',
      decription:
          'Lorum ipsum this is the dummy text, project description here',
      comments: 2,
      date: DateTime.now(),
      images: [
        'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
        'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdHoEvVXwwHJQEFlclzVc_wrEELWYQEbd6mw&s',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdHoEvVXwwHJQEFlclzVc_wrEELWYQEbd6mw&s',
      ],
    ),
  ];
}
