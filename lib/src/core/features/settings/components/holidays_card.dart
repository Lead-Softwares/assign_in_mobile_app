import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/components/general_container.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HolidaysCard extends StatelessWidget {
  const HolidaysCard({super.key, required this.holidayModel});
  final HolidayModel holidayModel;

  @override
  Widget build(BuildContext context) {
    return GeneralContainer(
      padding: const EdgeInsets.all(myPadding / 2),
      border: Border.all(color: Colors.grey.shade200),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: 55,
              clipBehavior: Clip.hardEdge,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: holidayModel.color.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(myPadding / 2),
              ),
              child: const Icon(
                CupertinoIcons.star,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
          const SizedBox(width: myPadding / 2),
          Expanded(
            flex: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(holidayModel.title, style: context.textTheme.bodyMedium),

                Text(
                  holidayModel.date,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontSize: 12,
                    color: MyColors.textColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: myPadding / 3),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(myPadding / 4),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(myPadding / 4),
              ),
              child: Icon(
                size: 18,
                CupertinoIcons.delete,
                color: Colors.red.shade600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HolidayModel {
  final String title;
  final String date;
  final Color color;
  HolidayModel({required this.title, required this.date, required this.color});
  static List<HolidayModel> dataList = [
    HolidayModel(color: Colors.blue, title: 'New Year', date: '1 January 2025'),
    HolidayModel(
      color: Colors.purple,
      title: 'Company Anniversary',
      date: '7 March',
    ),
    HolidayModel(
      color: Colors.green,
      title: 'Independence Day',
      date: 'Aug 14, 2025',
    ),
    HolidayModel(
      color: Colors.red,
      title: 'Chrismas Day',
      date: '25 December, 2025',
    ),
  ];
}
