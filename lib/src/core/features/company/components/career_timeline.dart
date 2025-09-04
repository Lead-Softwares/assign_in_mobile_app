// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/components/general_container.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:timelines_plus/timelines_plus.dart';

class CareerTimeLine extends StatelessWidget {
  const CareerTimeLine({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralContainer(
      border: Border.all(color: Colors.grey.shade200),
      color: Colors.grey.shade50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Career TimeLine',
            style: context.textTheme.bodyMedium?.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 120, child: ProgressLineWithText()),
          const SizedBox(height: myPadding / 2),
          const EmployeeJourneyProgress(),
        ],
      ),
    );
  }
}

class EmployeeJourneyProgress extends StatelessWidget {
  const EmployeeJourneyProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralContainer(
      borderRadius: BorderRadius.circular(myPadding / 1.5),
      border: Border.all(color: Colors.grey.shade200),
      color: Colors.blue.withValues(alpha: 0.04),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.circle, color: Colors.green, size: 16),
                  const SizedBox(width: myPadding / 4),
                  Text(
                    'Journey progress',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: MyColors.textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Text(
                '3 of 5 milestone',
                style: context.textTheme.bodySmall?.copyWith(
                  color: MyColors.textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: myPadding / 2),

          StepProgressIndicator(
            totalSteps: 25,
            currentStep: 15,
            // size: 4,
            padding: 0,

            roundedEdges: const Radius.circular(8),
            selectedGradientColor: LinearGradient(
              colors: [
                MyColors.gradientColor1,
                MyColors.gradientColor1.withValues(alpha: 0.5),
              ],
            ),
            unselectedColor: Colors.grey.shade300,
          ),
        ],
      ),
    );
  }
}

class ProgressLineWithText extends StatefulWidget {
  const ProgressLineWithText({super.key});

  @override
  State<ProgressLineWithText> createState() => _ProgressLineWithTextState();
}

class _ProgressLineWithTextState extends State<ProgressLineWithText> {
  int activeIndex = 0;
  final List<StepperModel> stepperData = [
    StepperModel(
      title: 'Joined',
      date: 'March 25',
      icon: Icons.calendar_month_outlined,
    ),
    StepperModel(title: 'Promotion', date: 'March 25', icon: Icons.settings),
    StepperModel(
      title: 'Increment',
      date: 'March 25',
      icon: CupertinoIcons.increase_indent,
    ),
    StepperModel(title: 'Upcoming', date: 'March 25', icon: Icons.access_time),
    StepperModel(title: 'Upcoming', date: 'March 25', icon: Icons.access_time),
  ];

  @override
  Widget build(BuildContext context) {
    final gradient = LinearGradient(
      begin: AlignmentGeometry.topLeft,
      end: AlignmentGeometry.bottomRight,
      colors: [MyColors.primaryColor, MyColors.gradient3],
    );

    return FixedTimeline.tileBuilder(
      mainAxisSize: MainAxisSize.min,

      theme: TimelineThemeData(
        direction: Axis.horizontal,
        connectorTheme: ConnectorThemeData(
          thickness: 2,

          color: Colors.grey.shade400,
        ),
        indicatorTheme: const IndicatorThemeData(color: Colors.white),
      ),
      builder: TimelineTileBuilder.connected(
        itemCount: stepperData.length,
        itemExtent: 64,
        connectionDirection: ConnectionDirection.before,
        indicatorBuilder: (context, index) {
          final stepItem = stepperData[index];
          final isActive = index <= activeIndex;

          return GestureDetector(
            onTap: () {
              setState(() {
                activeIndex = index;
              });
            },
            child: Container(
              height: 36,
              width: 36,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: isActive ? gradient : null,
                color: isActive ? MyColors.mainCOlor : Colors.white,
                border: Border.all(
                  color: isActive ? Colors.blue.shade300 : Colors.grey.shade300,
                  width: 1.5,
                ),
              ),
              child: Icon(
                stepItem.icon,
                size: 18,
                color: isActive ? Colors.white : Colors.grey.shade400,
              ),
            ),
          );
        },
        connectorBuilder: (context, index, connectorType) {
          final isActive = index < activeIndex + 1;
          return SolidLineConnector(
            color: isActive ? MyColors.mainCOlor : Colors.grey.shade400,
            thickness: 2,
          );
        },
        contentsBuilder: (context, index) {
          final stepItem = stepperData[index];
          final isActive = index <= activeIndex;
          return Column(
            children: [
              Text(
                stepItem.title,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.w400,
                  color: isActive ? Colors.black : Colors.grey,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                stepItem.date,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w400,
                  color: isActive ? Colors.black : Colors.grey,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class StepperModel {
  final IconData? icon;
  final String title;
  final String date;
  StepperModel({this.icon, required this.title, required this.date});
}
