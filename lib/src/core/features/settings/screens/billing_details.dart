import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:assign_in/src/core/features/settings/components/subscription_card.dart';
import 'package:flutter/material.dart';

class BillingDetails extends StatelessWidget {
  const BillingDetails({super.key});
  static const routeName = '/billing-details';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: myPadding / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          const SubscriptionCard(
            title: 'Proffessionals',
            amount: '\$29 /',
            description: ['Active until April 2025'],
            iscurrent: true,
          ),
          const UsageThisMonth(),
          Text(
            'Available Plans',
            style: context.textTheme.bodyLarge?.copyWith(fontSize: 14),
          ),
          const SubscriptionCard(
            amount: '\$9 /',
            title: 'Basic',
            description: ['Upto 5+ Employees', 'Email Support'],
          ),
          const SubscriptionCard(
            amount: '\$9 /',
            title: 'Enterprise',
            description: [
              'Unlimited Employees',
              'Custom reporting',
              '24/7 phone support',
              'Email Support',
            ],
          ),
        ],
      ),
    );
  }
}
