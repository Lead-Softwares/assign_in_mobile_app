import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/components/buttons.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:assign_in/src/core/features/admin_dashboard/components/bottom_sheet_data.dart';
import 'package:assign_in/src/core/features/settings/components/business_tabs.dart';
import 'package:assign_in/src/core/features/settings/components/edit_business_profile.dart';
import 'package:flutter/material.dart';

class ManageBusinessScreen extends StatelessWidget {
  const ManageBusinessScreen({super.key});
  static const routeName = '/manage-business';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Manage Business',
              style: context.textTheme.bodyLarge?.copyWith(fontSize: 16),
            ),
            Text(
              'Update your business information',
              style: context.textTheme.bodySmall?.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        actions: [const Icon(Icons.more_vert_outlined)],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: myPadding / 1.5,
          vertical: myPadding / 2,
        ),
        children: [
          const EditBusinessProfile(),
          const BusinessTabs(),
          const SizedBox(height: myPadding),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: CustomElevatedButton(
          text: 'Save Changes',
          onPress: () {
            companyDataList(context);
          },
        ),
      ),
      extendBody: true,
    );
  }
}
