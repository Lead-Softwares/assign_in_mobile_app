import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:assign_in/src/core/features/settings/model/setting_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingItemTile extends StatefulWidget {
  const SettingItemTile({super.key, required this.settingModel});
  final SettingModel settingModel;

  @override
  State<SettingItemTile> createState() => _SettingItemTileState();
}

class _SettingItemTileState extends State<SettingItemTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,

      horizontalTitleGap: 6,
      contentPadding: const EdgeInsets.all(0),
      onTap: widget.settingModel.onTap,
      title: Text(
        widget.settingModel.title,
        style: context.textTheme.bodyMedium,
      ),
      leading: _iconData(),

      trailing: const Icon(CupertinoIcons.forward),
    );
  }

  Widget _iconData() {
    if (widget.settingModel.image != null) {
      return SvgPicture.asset(
        widget.settingModel.image!,
        height: 22,
        width: 22,
        colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
      );
    } else if (widget.settingModel.icon != null) {
      return Icon(widget.settingModel.icon, color: Colors.black, size: 16);
    }
    return const SizedBox.shrink();
  }
}
