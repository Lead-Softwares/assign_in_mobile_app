import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });
  final String image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      expandedHeight: 80,
      automaticallyImplyLeading: false,

      title: Padding(
        padding: const EdgeInsets.only(top: myPadding / 2),
        child: Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage(image)),
            const SizedBox(width: myPadding / 3),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: context.textTheme.bodyLarge),
                Text(
                  subTitle,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: myPadding / 1.3),
          child: CircleAvatar(
            radius: 18,
            backgroundColor: Colors.grey.shade200,
            child: badges.Badge(
              position: badges.BadgePosition.topEnd(top: 1, end: 1),
              badgeStyle: const badges.BadgeStyle(
                borderSide: BorderSide(color: Colors.white, width: 1.3),

                padding: EdgeInsets.all(4),
              ),
              child: SvgPicture.asset(
                'assets/svg/notify.svg',
                height: 20,
                width: 20,
                fit: BoxFit.cover,
                colorFilter: const ColorFilter.mode(
                  Colors.black,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
