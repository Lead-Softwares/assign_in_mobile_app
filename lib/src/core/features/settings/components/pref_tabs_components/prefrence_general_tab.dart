import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/components/general_container.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:assign_in/src/core/features/settings/model/payment_model.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // shrinkWrap: true,
      children: [
        _title('General Role Preferences '),

        _generalRole(),
        const SizedBox(height: myPadding / 2),
        _title('Integrations'),

        _integration(),
      ],
    );
  }

  Widget _title(String text) {
    return Padding(
      padding: const EdgeInsets.all(myPadding / 2),
      child: Text(
        text,
        style: context.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _generalRole() {
    return GeneralContainer(
      margin: const EdgeInsets.symmetric(horizontal: myPadding / 2),

      boxShadow: [
        BoxShadow(
          blurRadius: 2,
          offset: const Offset(1, 1.5),
          color: Colors.grey.shade100,
          spreadRadius: 6,
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleWithSwitch(
            value: true,
            title: 'Allow HR to add members to team',
            onchange: (value) {
              setState(() {
                isSwitched = value;
              });
            },
          ),
          Divider(color: Colors.grey.shade300, height: 10),
          TitleWithSwitch(
            value: false,
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

  Widget _integration() {
    return GeneralContainer(
      margin: const EdgeInsets.symmetric(horizontal: myPadding / 2),
      boxShadow: [
        BoxShadow(
          blurRadius: 2,
          offset: const Offset(1, 1.5),
          color: Colors.grey.shade100,
          spreadRadius: 6,
        ),
      ],
      child: Column(
        children: [
          ...List.generate(PaymentModel.paymentData.length, (index) {
            final payment = PaymentModel.paymentData[index];

            return Column(
              children: [
                TitleWithSwitch(
                  title: payment.title,
                  value: payment.isConnected,
                  onchange: (value) {
                    setState(() {
                      PaymentModel.paymentData[index] = PaymentModel
                          .paymentData[index]
                          .copyWith(isConnected: value);
                    });
                  },
                ),
                // if (index != PaymentModel.paymentData.length - 1)
                Divider(color: Colors.grey.shade300, height: 10),
              ],
            );
          }),

          TitleWithSwitch(title: 'Email', value: false, onchange: (value) {}),
          Divider(color: Colors.grey.shade300, height: 10),
          TitleWithSwitch(title: 'SMS', value: true, onchange: (value) {}),
          Divider(color: Colors.grey.shade300, height: 10),
          TitleWithSwitch(title: 'TWilio', value: false, onchange: (value) {}),
        ],
      ),
    );
  }
}

class TitleWithSwitch extends StatelessWidget {
  const TitleWithSwitch({
    super.key,
    required this.title,
    required this.value,
    this.onchange,
  });

  final String title;
  final bool value;
  final ValueChanged<bool>? onchange;

  @override
  Widget build(BuildContext context) {
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
        SwitchWidget(value: value, onChanged: onchange),
      ],
    );
  }
}
