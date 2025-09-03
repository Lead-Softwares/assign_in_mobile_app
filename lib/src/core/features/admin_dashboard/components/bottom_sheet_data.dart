// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:assign_in/src/core/features/settings/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TileData extends StatefulWidget {
  const TileData({super.key, required this.itemModel});
  final ItemModel itemModel;

  @override
  State<TileData> createState() => _TileDataState();
}

class _TileDataState extends State<TileData> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: widget.itemModel.ontap,
          title: Text(
            widget.itemModel.title,
            style: context.textTheme.bodyMedium,
          ),
          leading: Container(
            height: 36,
            width: 36,
            padding: const EdgeInsets.all(myPadding / 2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient:
                  widget.itemModel.gradient ??
                  LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [MyColors.mainCOlor, MyColors.gradientColor1],
                  ),
            ),
            child: _iconData(),
          ),

          trailing: GestureDetector(
            onTap: widget.itemModel.ontap,
            child: const Icon(
              size: 15,
              Icons.arrow_forward_ios_sharp,
              color: Colors.black87,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: myPadding * 1.3),
          child: Divider(color: Colors.grey.shade300, height: 10, thickness: 1),
        ),
      ],
    );
  }

  Widget _iconData() {
    if (widget.itemModel.image != null) {
      return SvgPicture.asset(
        widget.itemModel.image!,
        height: 12,
        width: 12,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      );
    } else if (widget.itemModel.icon != null) {
      return Icon(widget.itemModel.icon, color: Colors.white, size: 16);
    }
    return const SizedBox.shrink();
  }
}

class ItemModel {
  final String title;
  final Function()? ontap;
  final IconData? icon;
  final String? image;
  final Gradient? gradient;
  ItemModel({
    required this.title,
    this.ontap,
    this.icon,
    this.image,
    this.gradient,
  });
}

Future<void> showItemsList(BuildContext context) {
  final List<ItemModel> itemsData = [
    ItemModel(
      title: 'Invite Team',
      image: 'assets/svg/team.svg',
      ontap: () => Navigator.pushNamed(context, SettingScreen.routeName),
    ),
    ItemModel(
      title: 'Add PayRolls',
      image: 'assets/svg/payrolls.svg',
      gradient: LinearGradient(
        end: Alignment.bottomCenter,
        begin: Alignment.topCenter,
        colors: [
          MyColors.mainCOlor,
          MyColors.gradientColor1,
          MyColors.gradientColor,
        ],
      ),
      ontap: () => Navigator.pushNamed(context, SettingScreen.routeName),
    ),
    ItemModel(title: 'Assignee Tasks', image: 'assets/svg/assignee.svg'),
    ItemModel(
      title: 'Add Project',
      image: 'assets/svg/project.svg',
      gradient: LinearGradient(
        end: Alignment.bottomCenter,
        begin: Alignment.topCenter,
        colors: [
          MyColors.mainCOlor,
          MyColors.gradientColor1,
          MyColors.gradientColor,
        ],
      ),
    ),
    ItemModel(title: 'Create deals', image: 'assets/svg/dollar.svg'),
  ];

  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          const SizedBox(height: myPadding / 2),

          SizedBox(
            width: context.width / 3.5,
            child: Divider(
              height: 10,
              color: Colors.black,
              thickness: 3,
              radius: BorderRadius.circular(16),
            ),
          ),
          const SizedBox(height: myPadding / 1.5),
          ListView.builder(
            shrinkWrap: true,
            itemCount: itemsData.length,
            itemBuilder: (context, index) {
              final items = itemsData[index];
              return TileData(itemModel: items);
            },
          ),
        ],
      );
    },
  );
}

Future<void> companyDataList(BuildContext context) {
  final List<ItemModel> itemsData = [
    ItemModel(
      title: 'Compnay Profile',
      image: 'assets/svg/user.svg',
      ontap: () => Navigator.pushNamed(context, SettingScreen.routeName),
    ),
    ItemModel(
      title: 'Company Documents',
      image: 'assets/svg/doc.svg',
      gradient: LinearGradient(
        end: Alignment.bottomCenter,
        begin: Alignment.topCenter,
        colors: [
          MyColors.mainCOlor,
          MyColors.gradientColor1,
          MyColors.gradientColor,
        ],
      ),
      ontap: () => Navigator.pushNamed(context, SettingScreen.routeName),
    ),

    ItemModel(title: 'Company Assets', image: 'assets/svg/asset.svg'),
  ];

  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          const SizedBox(height: myPadding / 2),

          SizedBox(
            width: context.width / 3.5,
            child: Divider(
              height: 10,
              color: Colors.black,
              thickness: 3,
              radius: BorderRadius.circular(16),
            ),
          ),
          const SizedBox(height: myPadding / 1.5),
          ListView.builder(
            shrinkWrap: true,
            itemCount: itemsData.length,
            itemBuilder: (context, index) {
              final items = itemsData[index];
              return TileData(itemModel: items);
            },
          ),
        ],
      );
    },
  );
}
