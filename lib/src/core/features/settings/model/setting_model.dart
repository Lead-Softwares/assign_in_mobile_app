// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SettingModel {
  final String title;
  final Function()? onTap;
  final IconData? icon;
  final String? image;
  final String? subTitle;
  final String? suffixText;
  final Widget? trailing;
  SettingModel({
    required this.title,
    this.onTap,
    this.icon,
    this.image,
    this.subTitle,
     this.suffixText,
     this.trailing,
  });
}
