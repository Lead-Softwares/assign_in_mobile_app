import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/components/general_container.dart';
import 'package:assign_in/src/core/components/radio_button_list.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:assign_in/src/core/features/settings/enum/role_enum.dart';
import 'package:flutter/material.dart';

class PrefOtherTab extends StatefulWidget {
  const PrefOtherTab({super.key});

  @override
  State<PrefOtherTab> createState() => _PrefOtherTabState();
}

class _PrefOtherTabState extends State<PrefOtherTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title('Recruitment Permissions'),
        _bgContainer(
          RadioButtonsWithTitle<UserEnum>(
            options: UserEnum.values,
            getTitle: (type) => type.title,
            onChanged: (value) {
              setState(() {});
            },
          ),
        ),

        const SizedBox(height: myPadding / 2),
        _title('Leaves Approval Workflow'),
        _bgContainer(
          RadioButtonsWithTitle<UserEnum>(
            options: UserEnum.values,
            getTitle: (type) => type.title,
            onChanged: (value) {
              setState(() {});
            },
          ),
        ),
        const SizedBox(height: myPadding / 2),

        _title('Expense Claim'),
        _bgContainer(
          RadioButtonsWithTitle<RoleEnum>(
            options: RoleEnum.values,
            getTitle: (type) => type.title,
            onChanged: (value) {
              setState(() {});
            },
          ),
        ),

        const SizedBox(height: myPadding / 2),
        _title('Assets Management'),
        _bgContainer(
          RadioButtonsWithTitle<RoleEnum>(
            options: RoleEnum.values,
            getTitle: (type) => type.title,
            onChanged: (value) {
              setState(() {});
            },
          ),
        ),

        const SizedBox(height: myPadding * 4),
      ],
    );
  }

  Widget _bgContainer(Widget child) {
    return GeneralContainer(
      margin: const EdgeInsets.symmetric(horizontal: myPadding / 2),
      border: Border.all(color: Colors.grey.shade200),
      child: child,
    );
  }

  Widget _title(String text) {
    return Padding(
      padding: const EdgeInsets.all(myPadding / 2),
      child: Text(
        text,
        style: context.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
