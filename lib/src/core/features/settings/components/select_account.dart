import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/components/general_container.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

Future<void> selectAccount(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: myPadding,
          vertical: myPadding / 2,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: myPadding / 2),

            Container(
              height: 5,
              width: context.width / 3.5,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            // const SizedBox(height: myPadding / 1.5),
            GeneralContainer(
              margin: const EdgeInsetsGeometry.symmetric(
                horizontal: myPadding / 2,
                vertical: myPadding,
              ),

              // height: 200,
              color: Colors.grey.shade100,
              border: Border.all(width: 1.5, color: Colors.grey.shade200),
              child: ListView(
                shrinkWrap: true,
                children: [
                  TileData(
                    image: 'assets/images/beta.png',
                    title: 'Admin',
                    trailing: Icon(
                      Icons.check_circle,
                      color: Colors.green.shade700,
                    ),
                  ),
                  const TileData(
                    image: 'assets/images/Ellipse 1.png',
                    title: 'Hr Manager',
                  ),
                  ListTile(
                    minTileHeight: 55,

                    contentPadding: const EdgeInsets.all(0),
                    onTap: () {},
                    title: Text(
                      'Add a New Account',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: MyColors.gradientColor1,
                        fontSize: 13,
                      ),
                    ),
                    leading: Container(
                      height: 36,
                      width: 36,
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

class TileData extends StatelessWidget {
  const TileData({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
    this.trailing,
  });
  final String image;
  final String title;
  final Function()? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minTileHeight: 65,
      contentPadding: const EdgeInsets.all(0),
      onTap: onTap,
      title: Text('Beta Co', style: context.textTheme.bodyMedium),
      subtitle: Text(
        title,
        style: context.textTheme.bodyMedium?.copyWith(
          color: Colors.grey.shade600,
          fontSize: 13,
        ),
      ),
      leading: Container(
        height: 36,
        width: 36,
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.all(2.5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              MyColors.mainCOlor,
              MyColors.gradientColor1,
              MyColors.gradient3,
              MyColors.gradient2,
              Colors.grey,
            ],
          ),
        ),
        child: Image.asset(image, fit: BoxFit.cover, height: 36, width: 36),
      ),

      trailing: trailing,
    );
  }
}
