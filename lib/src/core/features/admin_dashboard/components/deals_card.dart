import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/components/general_container.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:assign_in/src/core/features/overview/components/recent_projects.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class DealsCard extends StatelessWidget {
  const DealsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralContainer(
      margin: const EdgeInsets.symmetric(
        horizontal: myPadding,
        vertical: myPadding / 2,
      ),
      padding: const EdgeInsets.all(12),
      height: 100,
      border: Border.all(color: Colors.grey.shade200, width: 1.5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Empower move', style: context.textTheme.bodyMedium),
              BadgeContainer(
                color: Colors.green.shade50,
                child: Text(
                  'Qualified',
                  style: context.textTheme.bodySmall?.copyWith(
                    color: Colors.green.shade600,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: myPadding / 2),
          const Row(
            children: [
              ShowTime(
                size: 16,
                image: 'assets/svg/dollar.svg',

                text: '\$500',
                fontSize: 12,
                textColor: Colors.grey,
              ),
              SizedBox(width: myPadding / 2),
              ShowTime(
                size: 16,
                image: 'assets/svg/calender.svg',

                text: 'Expected close date: Aug 28, 2025',
                textColor: Colors.grey,

                fontSize: 10,
              ),
            ],
          ),
          const SizedBox(height: myPadding / 2),
          StepProgressIndicator(
            totalSteps: 5,
            currentStep: 2,
            size: 6,
            padding: 3,
            selectedColor: MyColors.primaryColor,
            customColor: (index) {
              if (index == 0) return MyColors.primaryColor;
              if (index == 1) return Colors.green.shade800;
              return Colors.grey.shade400;
            },
          ),
        ],
      ),
    );
  }
}
