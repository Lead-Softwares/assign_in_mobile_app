import 'dart:core';

import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/components/general_container.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:assign_in/src/core/features/overview/components/recent_projects.dart';
import 'package:flutter/material.dart';

class TodayOverview extends StatefulWidget {
  const TodayOverview({super.key});

  @override
  State<TodayOverview> createState() => _TodayOverviewState();
}

class _TodayOverviewState extends State<TodayOverview> {
  @override
  Widget build(BuildContext context) {
    return GeneralContainer(
      gradient:  LinearGradient(
        colors: [MyColors.mainCOlor, MyColors.gradientColor],
      ),
      margin: const EdgeInsets.symmetric(horizontal: myPadding / 1.5),

      padding: const EdgeInsets.symmetric(
        horizontal: myPadding / 1.5,
        vertical: myPadding / 2,
      ),
      color: MyColors.primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _topSection(),
          const SizedBox(height: myPadding / 2),
          Text(
            'May 3, 2025',
            style: context.textTheme.bodyMedium?.copyWith(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: myPadding / 2),

          GeneralContainer(
            padding: const EdgeInsets.symmetric(
              horizontal: myPadding,
              vertical: myPadding / 2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _ClockData(
                  time: '08:45: PM',
                  title: 'Clock in',
                  color: Colors.green,
                  context: context,
                ),
                SizedBox(
                  height: 40,
                  child: VerticalDivider(
                    color: Colors.grey.shade400,
                    width: 10,
                    thickness: 1,
                  ),
                ),
                _ClockData(
                  time: '08:45: PM',
                  title: 'Clock out',
                  color: Colors.red,
                  context: context,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _topSection() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 14,
          backgroundColor: Colors.white24,
          child: Icon(Icons.access_time, color: Colors.white, size: 16),
        ),
        const SizedBox(width: myPadding / 4),
        Text(
          'Today\'s Overview',
          style: context.textTheme.bodyMedium?.copyWith(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        BadgeContainer(
          child: Row(
            children: [
              CircleAvatar(radius: 5, backgroundColor: Colors.green.shade700),
              const SizedBox(width: myPadding / 3),
              Text(
                '08:45 PM',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: MyColors.primaryColor,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ClockData extends StatelessWidget {
  const _ClockData({
    required this.context,
    required this.time,
    required this.title,
    required this.color,
  });
  final String time;
  final String title;
  final Color color;

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShowTime(
          icon: Icons.access_time,
          text: title,
          iconColor: color.withValues(alpha: 0.8),
          textColor: color,
          fontSize: 12,
          size: 18,
        ),
        const SizedBox(height: myPadding / 3),
        Text(
          time,
          style: context.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
