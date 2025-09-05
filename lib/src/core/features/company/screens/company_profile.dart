import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/features/company/components/career_timeline.dart';
import 'package:assign_in/src/core/features/company/components/profile_container.dart';
import 'package:assign_in/src/core/features/company/components/profile_information.dart';
import 'package:flutter/material.dart';

class CompanyProfile extends StatelessWidget {
  const CompanyProfile({super.key});
  static const routeName = '/company-profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Company Profile')),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(myPadding / 2),
        children: [
          const ProfileWidget(),
          const CareerTimeLine(),
          const ProfileInformation(),
          const SizedBox(height: myPadding * 2),
        ],
      ),
    );
  }
}
