import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:assign_in/src/core/features/settings/components/prefrences_tabs.dart';
import 'package:flutter/material.dart';

class PrefrenecesScreen extends StatelessWidget {
  const PrefrenecesScreen({super.key});
  static const routeName = '/prefrences';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Prefrences', style: context.textTheme.bodyLarge),
            Text(
              maxLines: 2,
              'Manage role-based access and organization-wide preferences.',
              style: context.textTheme.bodySmall?.copyWith(
                color: MyColors.textColor,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(myPadding),
        // shrinkWrap: true,
        children: [const PrefrencesTabs()],
      ),
    );
  }
}
