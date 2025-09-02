import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/components/general_container.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class IntegrationDetails extends StatelessWidget {
  const IntegrationDetails({super.key});
  static const routeName = '/integration-details';

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: myPadding / 2),
      children: [
        Text(
          'Payment Integrations',
          style: context.textTheme.bodyLarge?.copyWith(fontSize: 14),
        ),
        const SizedBox(height: myPadding / 4),
        Text(
          'Connect payment providers to accept payments',
          style: context.textTheme.bodyMedium?.copyWith(
            color: MyColors.textColor,
            fontSize: 11,
            fontWeight: FontWeight.w100,
          ),
        ),
        const SizedBox(height: myPadding / 2),
        GeneralContainer(
          padding: const EdgeInsetsGeometry.all(myPadding / 1.3),
          border: Border.all(color: Colors.grey.shade300),

          color: Colors.blue.withValues(alpha: 0.08),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Item(
                color: Colors.green.shade700,
                title: 'Connected',
                value: '2',
              ),
              Item(
                color: MyColors.gradientColor,
                title: 'Available',
                value: '37',
              ),
              Item(color: MyColors.mainCOlor, title: 'Revenue', value: '2.5k'),
            ],
          ),
        ),
      ],
    );
  }
}

class Item extends StatelessWidget {
  const Item({
    super.key,
    required this.value,
    required this.title,
    required this.color,
  });
  final String value;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: context.textTheme.bodyMedium?.copyWith(
            color: color,
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: myPadding / 2),
        Text(
          title,
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
