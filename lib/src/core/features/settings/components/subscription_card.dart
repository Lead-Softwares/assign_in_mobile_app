import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/components/general_container.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:assign_in/src/core/features/overview/components/recent_projects.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class UsageThisMonth extends StatelessWidget {
  const UsageThisMonth({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralContainer(
      borderRadius: BorderRadius.circular(myPadding / 2),
      border: Border.all(color: Colors.grey.shade300),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Usage This Month',
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const ProgressTitle(title: 'Employees', total: '25', value: '15'),
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
          const SizedBox(height: myPadding / 3),
          const ProgressTitle(
            title: 'Storage',
            total: '25 GB Data',
            value: '15 GB',
          ),

          StepProgressIndicator(
            totalSteps: 25,
            currentStep: 15,
            size: 8,
            padding: 0,
            unselectedColor: Colors.grey.shade300,

            roundedEdges: const Radius.circular(8),
            selectedGradientColor: LinearGradient(
              colors: [Colors.green.shade800, MyColors.gradient3],
            ),
          ),
          const SizedBox(height: myPadding / 3),
        ],
      ),
    );
  }
}

class ProgressTitle extends StatelessWidget {
  const ProgressTitle({
    super.key,
    required this.title,
    required this.value,
    required this.total,
  });
  final String title;
  final String value;
  final String total;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: myPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.textTheme.bodySmall?.copyWith(
              fontSize: 11,
              color: MyColors.textColor,
            ),
          ),
          Text(
            '$value / $total',
            style: context.textTheme.bodySmall?.copyWith(
              fontSize: 10,
              color: MyColors.textColor,
            ),
          ),
        ],
      ),
    );
  }
}

class SubscriptionCard extends StatelessWidget {
  const SubscriptionCard({
    super.key,
    required this.title,
    required this.amount,
    this.description,
    this.iscurrent,
  });
  final String title;
  final String amount;
  final List<String>? description;
  final bool? iscurrent;

  @override
  Widget build(BuildContext context) {
    return GeneralContainer(
      color: iscurrent == true
          ? Colors.blue.shade50.withValues(alpha: 0.5)
          : Colors.grey.shade100,
      borderRadius: BorderRadius.circular(myPadding / 2),
      border: Border.all(color: Colors.grey.shade200),
      child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              iscurrent == true
                  ? BadgeContainer(
                      color: Colors.black,
                      child: Text(
                        'Current plane',
                        style: context.textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),

          const SizedBox(height: myPadding / 3),
          Text(
            'Most popular for growing teams',
            style: context.textTheme.bodySmall?.copyWith(
              color: MyColors.textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: myPadding / 3),
          Row(
            children: [
              ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: iscurrent == true
                      ? [MyColors.gradientColor1, const Color(0xFFcc6470)]
                      : [const Color(0xFFcc6470), MyColors.gradientColor1],
                ).createShader(bounds),
                blendMode: BlendMode.srcIn,
                child: Text(
                  amount,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: context.textTheme.bodyMedium?.fontFamily,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: myPadding / 3),

              Text(
                'month',
                style: context.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: MyColors.textColor,
                ),
              ),
            ],
          ),

          const SizedBox(height: myPadding / 3),
          GridView.builder(
            itemCount: description?.length ?? 0,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 5,
            ),
            itemBuilder: (context, index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check,
                    color: iscurrent == true
                        ? Colors.green.shade500
                        : Colors.grey.shade500,
                    size: 18,
                  ),
                  const SizedBox(width: myPadding / 4),
                  Expanded(
                    child: Text(
                      description![index],
                      style: context.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                        color: iscurrent == true
                            ? Colors.green.shade500
                            : Colors.grey.shade600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
