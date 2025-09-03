import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/components/general_container.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralContainer(
      padding: const EdgeInsetsGeometry.all(myPadding),
      color: Colors.grey.shade200,
      border: Border.all(color: Colors.white, width: 1.5),
      boxShadow: [
        BoxShadow(blurRadius: 4, spreadRadius: 2, color: Colors.grey.shade200),
      ],
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  MyColors.mainCOlor,
                  MyColors.gradient2,
                  MyColors.gradient3,
                ],
              ),
              shape: BoxShape.circle,
              color: Colors.white,
              // border: Border.all(color: Colors.white),
            ),

            child: const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://cdn.expertphotography.com/wp-content/uploads/2020/08/social-media-profile-photos.jpg',
              ),
            ),
          ),
          const SizedBox(height: myPadding * 1.5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: myPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildItem('Years', '2.5', null, context),
                SizedBox(
                  height: myPadding * 2,
                  child: VerticalDivider(
                    color: Colors.grey.shade400,
                    width: 10,
                  ),
                ),
                _buildItem('Status', 'Active', Colors.green.shade600, context),
                SizedBox(
                  height: myPadding * 2,
                  child: VerticalDivider(
                    color: Colors.grey.shade400,
                    width: 10,
                  ),
                ),

                _buildItem('team', 'Design', null, context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(
    String title,
    String value,
    Color? color,
    BuildContext context,
  ) {
    return Column(
      children: [
        Text(
          value,
          style: context.textTheme.bodyMedium?.copyWith(
            color: color ?? Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: myPadding / 2),
        Text(
          title,
          style: context.textTheme.bodyMedium?.copyWith(
            color: MyColors.textColor,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
