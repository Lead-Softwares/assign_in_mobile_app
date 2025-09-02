import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class BillingDetails extends StatelessWidget {
  const BillingDetails({super.key});
  static const routeName = '/billing-details';

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: myPadding / 2),
      children: [
        Text(
          'Billing & Subscription',
          style: context.textTheme.bodyLarge?.copyWith(fontSize: 14),
        ),
        const SizedBox(height: myPadding / 4),
        Text(
          'Manage your subscription and billing information',
          style: context.textTheme.bodyMedium?.copyWith(
            color: MyColors.textColor,
            fontSize: 11,
            fontWeight: FontWeight.w100,
          ),
        ),
        const SizedBox(height: myPadding / 2),
      ],
    );
  }
}
