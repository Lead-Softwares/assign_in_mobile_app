import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/components/general_container.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ProfileTile(title: 'Department', name: 'Designing'),
        ProfileTile(title: 'Job Title', name: 'UI/ UX designer'),
        ProfileTile(title: 'Work Location', name: 'On site'),
        ProfileTile(
          title: 'Office Address',
          name: '2972 Westheimer Rd. Santa Ana, Illinois 85486 ',
        ),
        ProfileTile(title: 'Employee Type', name: 'Full time'),
      ],
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({super.key, required this.title, required this.name});
  final String title;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GeneralContainer(
      padding: const EdgeInsets.symmetric(
        horizontal: myPadding / 1.5,
        vertical: myPadding / 2,
      ),
      borderRadius: BorderRadius.circular(myPadding / 2),

      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.textTheme.bodySmall?.copyWith(
              color: MyColors.textColor,
            ),
          ),
          const SizedBox(height: myPadding / 4),
          Text(title, style: context.textTheme.bodyMedium),
        ],
      ),
    );
  }
}
