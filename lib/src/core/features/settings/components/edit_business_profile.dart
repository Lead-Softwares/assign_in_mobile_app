import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/components/general_container.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:assign_in/src/core/features/overview/components/recent_projects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EditBusinessProfile extends StatelessWidget {
  const EditBusinessProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralContainer(
      height: 120,
      padding: const EdgeInsetsGeometry.all(myPadding),
      gradient: LinearGradient(
        colors: [
          // Colors.deepPurple,
          Colors.purple.shade400,
          Colors.purple.shade300,

          const Color(0xFffa39ba).withValues(alpha: 0.8),
          Colors.pinkAccent.withValues(alpha: 0.7),
          Colors.redAccent.withValues(alpha: 0.7),
          Colors.red.withValues(alpha: 0.7),
          Colors.orange.shade700,
        ],
        stops: [0.15, 0.3, 0.5, 0.6, 0.75, 0.9, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          _editPicture(),
          const SizedBox(width: myPadding / 2),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Beta Co',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(width: myPadding * 4),
                  BadgeContainer(
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          height: 20,
                          width: 20,
                          'assets/svg/material-icon-theme_verified.svg',
                        ),
                        // const Icon(CupertinoIcons.checkmark_alt_circle),
                        const SizedBox(width: myPadding / 2),
                        Text(
                          'Active',
                          style: context.textTheme.bodySmall?.copyWith(
                            color: Colors.green.shade600,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: myPadding / 2),
              Text(
                'Software Development\n & Consulting',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _editPicture() {
    return Stack(
      children: [
        Container(
          height: 80,
          width: 80,
          clipBehavior: Clip.hardEdge,
          padding: const EdgeInsets.all(1.5),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Image.asset(
            'assets/images/beta.png',
            fit: BoxFit.cover,
            height: 36,
            width: 36,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            height: 32,
            width: 32,
            margin: const EdgeInsets.only(left: 46),
            clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white),
              color: MyColors.gradientColor1,
            ),
            child: const Icon(Icons.edit_outlined, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
