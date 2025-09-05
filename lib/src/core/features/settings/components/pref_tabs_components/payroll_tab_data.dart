import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/components/general_container.dart';
import 'package:assign_in/src/core/components/radio_button_list.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:assign_in/src/core/features/overview/components/recent_projects.dart';
import 'package:assign_in/src/core/features/settings/enum/role_enum.dart';
import 'package:assign_in/src/core/features/settings/model/payroll_integration_model.dart';
import 'package:flutter/material.dart';

class PayrollTabData extends StatefulWidget {
  const PayrollTabData({super.key});

  @override
  State<PayrollTabData> createState() => _PayrollTabDataState();
}

class _PayrollTabDataState extends State<PayrollTabData> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // shrinkWrap: true,
      children: [
        // ...List.generate(
        //   7,
        //   (index) => GeneralContainer(
        //     child: SizedBox(height: 100),
        //     color: Colors.teal,
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.all(myPadding / 2),
          child: _title('Payroll Permission'),
        ),

        _bgContainer(
          RadioButtonsWithTitle<RoleEnum>(
            options: RoleEnum.values,
            getTitle: (type) => type.title,
            onChanged: (value) {
              setState(() {});
            },
          ),
        ),
        const SizedBox(height: myPadding),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: myPadding / 2),
          child: _title('Integrations'),
        ),
        _bgContainer(
          Column(
            children: [
              ...List.generate(
                PayrollIntegrationModel.payrollvalues.length,
                (index) => PayrollCard(
                  integrationModel:
                      PayrollIntegrationModel.payrollvalues[index],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(myPadding / 2),
          child: _title('Cut-off date for payroll'),
        ),
        _bgContainer(
          Column(
            children: [
              ...List.generate(
                CutOffDateModel.cutoffDateValues.length,
                (index) => CutOffCard(
                  cutoffModel: CutOffDateModel.cutoffDateValues[index],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: myPadding * 4),
      ],
    );
  }

  Widget _bgContainer(Widget child) {
    return GeneralContainer(
      margin: const EdgeInsetsGeometry.all(myPadding / 4),
      boxShadow: [
        BoxShadow(
          blurRadius: 2,
          spreadRadius: 4,
          offset: const Offset(1, 1.5),
          color: Colors.grey.shade200,
        ),
      ],
      padding: const EdgeInsets.all(myPadding / 2),
      child: child,
    );
  }

  Widget _title(String text) {
    return Text(
      text,
      style: context.textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class PayrollCard extends StatefulWidget {
  const PayrollCard({super.key, required this.integrationModel});
  final PayrollIntegrationModel integrationModel;

  @override
  State<PayrollCard> createState() => _PayrollCardState();
}

class _PayrollCardState extends State<PayrollCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: GeneralContainer(
        padding: const EdgeInsetsGeometry.all(myPadding),
        gradient: isSelected == false
            ? const LinearGradient(colors: [Colors.white, Colors.white])
            : LinearGradient(
                colors: [
                  Colors.purpleAccent.withValues(alpha: 0.8),
                  Colors.purple.shade600,
                ],
              ),
        border: Border.all(
          color: isSelected ? Colors.white : Colors.grey.shade200,
          width: 1.5,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.integrationModel.title,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: isSelected ? Colors.white : Colors.black87,
                  ),
                ),
                Text(
                  widget.integrationModel.subTitle,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: isSelected ? Colors.white : MyColors.textColor,
                  ),
                ),
              ],
            ),
            const Spacer(),
            BadgeContainer(
              color: isSelected
                  ? Colors.white.withValues(alpha: 0.2)
                  : Colors.grey.shade200,
              child: Text(
                widget.integrationModel.timeLimit,
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 11,
                  fontWeight: isSelected ? FontWeight.bold : null,
                  color: isSelected ? Colors.white : MyColors.textColor,
                ),
              ),
            ),
            const SizedBox(width: myPadding / 2),
            Icon(
              Icons.radio_button_checked,
              color: isSelected ? Colors.green.shade400 : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

class CutOffCard extends StatefulWidget {
  const CutOffCard({super.key, required this.cutoffModel});
  final CutOffDateModel cutoffModel;

  @override
  State<CutOffCard> createState() => _CutOffCardState();
}

class _CutOffCardState extends State<CutOffCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: GeneralContainer(
        padding: const EdgeInsetsGeometry.all(myPadding),
        gradient: isSelected == false
            ? const LinearGradient(colors: [Colors.white, Colors.white])
            : LinearGradient(
                colors: [
                  Colors.blueAccent.withValues(alpha: 0.7),
                  // Colors.blue.shade500,
                  const Color(0xFF306eff),
                ],
              ),
        border: Border.all(
          color: isSelected ? Colors.white : Colors.grey.shade200,
          width: 1.5,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.cutoffModel.title,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: isSelected ? Colors.white : Colors.black87,
                  ),
                ),
                Text(
                  widget.cutoffModel.subTitle,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: isSelected ? Colors.white : MyColors.textColor,
                  ),
                ),
              ],
            ),
            const Spacer(),
            BadgeContainer(
              color: isSelected
                  ? Colors.white.withValues(alpha: 0.2)
                  : Colors.grey.shade200,
              child: Text(
                widget.cutoffModel.timeLimit,
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 11,
                  fontWeight: isSelected ? FontWeight.bold : null,
                  color: isSelected ? Colors.white : MyColors.textColor,
                ),
              ),
            ),
            const SizedBox(width: myPadding / 2),
            Icon(
              Icons.radio_button_checked,
              color: isSelected ? Colors.green.shade400 : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
