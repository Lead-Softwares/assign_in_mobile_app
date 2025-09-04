import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/components/general_container.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:assign_in/src/core/features/overview/components/recent_projects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AssetCard extends StatelessWidget {
  const AssetCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralContainer(
      border: Border.all(color: Colors.grey.shade200),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: 55,

                  clipBehavior: Clip.hardEdge,
                  margin: const EdgeInsets.symmetric(vertical: myPadding / 2),
                  padding: const EdgeInsets.all(myPadding / 1.5),
                  decoration: BoxDecoration(
                    // color: Colors.black,
                    //  color: if(),
                    color: MyColors.primaryColor,
                    borderRadius: BorderRadius.circular(myPadding / 2),
                  ),
                  child: SvgPicture.asset('assets/svg/solar_box-linear.svg'),
                ),
              ),
              const SizedBox(width: myPadding / 2),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: myPadding / 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Valve Manifold',
                        style: context.textTheme.bodyMedium,
                      ),
                      const SizedBox(height: myPadding / 4),

                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_month,
                            color: Colors.grey,
                            size: 18,
                          ),
                          const SizedBox(width: myPadding / 2),
                          Text(
                            'Assignee date . Mar 24, 2025',
                            style: context.textTheme.bodyMedium?.copyWith(
                              fontSize: 12,
                              color: MyColors.textColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: Colors.grey,
                size: 18,
              ),
              Text(
                'Warehouse A, Section 3',
                style: context.textTheme.bodyMedium?.copyWith(
                  fontSize: 12,
                  color: MyColors.textColor,
                ),
              ),
            ],
          ),

          const BadgeList(),
        ],
      ),
    );
  }
}

class BadgeList extends StatelessWidget {
  const BadgeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GeneralContainer(
          borderRadius: BorderRadius.circular(myPadding / 2),
          width: 80,
          border: Border.all(color: Colors.grey.shade300),
          color: Colors.blue.shade50,
          child: Text(
            textAlign: TextAlign.center,

            '\$8765',
            style: context.textTheme.bodyMedium?.copyWith(
              color: MyColors.gradientColor1,
              fontSize: 12,
            ),
          ),
        ),
        GeneralContainer(
          borderRadius: BorderRadius.circular(myPadding / 2),
          width: 110,
          border: Border.all(color: Colors.grey.shade300),
          color: Colors.pink.shade50,
          child: Text(
            textAlign: TextAlign.center,
            'V-00081478',
            style: context.textTheme.bodyMedium?.copyWith(
              color: Colors.purple.shade700,
              fontSize: 12,
            ),
          ),
        ),

        BadgeContainer(
          color: Colors.green.shade50,
          child: const Row(
            children: [
              Icon(Icons.circle, size: 14, color: Colors.green),
              SizedBox(width: myPadding / 4),
              Text(
                'Active',
                style: TextStyle(fontSize: 10, color: Colors.green),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
