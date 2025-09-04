import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/components/general_container.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class PrefrenceGeneralTab extends StatefulWidget {
  const PrefrenceGeneralTab({super.key});

  @override
  State<PrefrenceGeneralTab> createState() => _PrefrenceGeneralTabState();
}

class _PrefrenceGeneralTabState extends State<PrefrenceGeneralTab> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Text('General Role Preferences ', style: context.textTheme.bodyMedium),
        const SizedBox(height: myPadding / 2),

        _generalRole(),
        const SizedBox(height: myPadding / 2),
        Text('Integrations', style: context.textTheme.bodyMedium),
      ],
    );
  }

  Widget _generalRole() {
    return GeneralContainer(
      height: 120,
      boxShadow: [
        BoxShadow(
          blurRadius: 2,
          offset: const Offset(2, 1.5),
          color: Colors.grey.shade100,
          spreadRadius: 4,
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleWithSwitch(
            title: 'Allow HR to add members to team',
            onchange: (value) {
              setState(() {
                isSwitched = value;
              });
            },
          ),
          Divider(color: Colors.grey.shade300, height: 10),
          TitleWithSwitch(
            title: 'Allow Manager to remove HR',
            onchange: (value) {
              setState(() {
                isSwitched = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

class TitleWithSwitch extends StatelessWidget {
  const TitleWithSwitch({super.key, required this.title, this.onchange});
  final String title;
  final ValueChanged<bool>? onchange;

  @override
  Widget build(BuildContext context) {
    final bool isSwitched = false;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.textTheme.bodyMedium?.copyWith(
            color: MyColors.textColor,
            fontSize: 12,
          ),
        ),
        SwitchWidget(value: isSwitched, onChanged: onchange),
      ],
    );
  }
}
