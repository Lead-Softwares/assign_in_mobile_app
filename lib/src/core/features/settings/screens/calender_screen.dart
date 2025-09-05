import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/components/general_container.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:assign_in/src/core/features/settings/components/date_format_widget.dart';
import 'package:assign_in/src/core/features/settings/components/holidays_card.dart';
import 'package:assign_in/src/core/features/settings/components/select_time_zone.dart';
import 'package:flutter/material.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});
  static const routeName = '/calender';

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calender')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: myPadding / 2),
        children: [
          _title('Time Zone'),
          const TimeZoneSelector(),
          _currentTime(),
          _title('Date Format'),
          const DateFormatWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _title('Holidays & Off Days'),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Add',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: MyColors.primaryColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
           ...List.generate(HolidayModel.dataList.length, (index)=>
                         HolidaysCard(holidayModel: HolidayModel.dataList[index],),)

        ],
      ),
    );
  }

  Widget _title(String title) {
    return Padding(
      padding: const EdgeInsetsGeometry.all(myPadding / 2),
      child: Text(
        title,
        style: context.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _currentTime() {
    return GeneralContainer(
      border: Border.all(color: Colors.grey.shade300),
      color: Colors.blue.shade50,
      borderRadius: BorderRadius.circular(myPadding / 2),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Current Time',
                style: context.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: MyColors.textColor,
                ),
              ),
              Text(
                'Date',
                style: context.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: MyColors.textColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: myPadding / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '2:45 PM',
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: MyColors.mainCOlor,
                ),
              ),
              Text(
                '06 Sep, 2025',
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: MyColors.mainCOlor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
