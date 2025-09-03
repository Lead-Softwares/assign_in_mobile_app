import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/components/general_container.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

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
          const SizedBox(height: myPadding / 2),
          const ProgressLineWithText(),
          // CustomStepper(),
          const SizedBox(height: myPadding / 2),
          const JourneyProgress(),
        ],
      ),
    );
  }
}

class JourneyProgress extends StatelessWidget {
  const JourneyProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralContainer(
      borderRadius: BorderRadius.circular(myPadding / 2),
      border: Border.all(color: Colors.blue.shade50),
      color: Colors.grey.shade100,
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
            size: 8,
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

class CustomStepper extends StatefulWidget {
  const CustomStepper({super.key});

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  int activeStep = 0;

  @override
  Widget build(BuildContext context) {
    return DotStepper(
      dotRadius: 20,
      lineConnectorsEnabled: true,
      lineConnectorDecoration: LineConnectorDecoration(
        color: MyColors.mainCOlor,
        strokeWidth: 2,
      ),
      dotCount: 5,
      activeStep: activeStep,
      spacing: 25,
      indicatorDecoration: IndicatorDecoration(color: MyColors.mainCOlor),
      onDotTapped: (index) {
        setState(() {
          activeStep = index;
        });
      },
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

  final List<String> labels = [
    'Joined',
    'Promotion',
    'Increment',
    'upcoming',
    'upcoming',
  ];

  final List<IconData> icons = [
    Icons.calendar_month_outlined,
    Icons.settings,
    Icons.first_page,
    Icons.access_time,
    Icons.access_time,
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: List.generate(labels.length, (index) {
            final isActive = index <= activeIndex;

            return Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            activeIndex = index;
                          });
                        },
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: isActive
                              ? MyColors.mainCOlor
                              : Colors.grey.shade400,
                          child: Icon(icons[index], color: Colors.white),
                        ),
                      ),
                      if (index < labels.length - 1)
                        Expanded(
                          child: Container(
                            height: 4,
                            color: index < activeIndex
                                ? MyColors.mainCOlor
                                : Colors.grey.shade400,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    labels[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w400,
                      color: isActive ? Colors.black : Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}
