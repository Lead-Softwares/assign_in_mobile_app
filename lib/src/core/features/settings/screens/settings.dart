import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/components/general_container.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:assign_in/src/core/features/hr_dashboard/screens/hr_dashboard_screen.dart';
import 'package:assign_in/src/core/features/settings/components/select_account.dart';
import 'package:assign_in/src/core/features/settings/components/setting_item_tile.dart';
import 'package:assign_in/src/core/features/settings/model/setting_model.dart';
import 'package:assign_in/src/core/features/settings/screens/manage_business.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});
  static const routeName = '/settings';

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final List<SettingModel> settingItems = [
    SettingModel(
      title: 'Mails',
      suffixText: 'leads@gmail.com',
      icon: Icons.email_outlined,
      routeName: HrDashboard.routeName,
    ),
    SettingModel(
      title: 'Company Center',
      suffixText: '',
      image: 'assets/svg/carbon_location-company.svg',
    ),
    SettingModel(
      title: 'Insights',
      suffixText: '',
      icon: Icons.insights_rounded,
    ),
    SettingModel(title: 'Prefrences', image: 'assets/svg/bitcoin.svg'),
    SettingModel(
      title: 'Notifications',
      icon: Icons.notification_important_outlined,
    ),
    SettingModel(title: 'Permissions', image: 'assets/svg/security.svg'),
    SettingModel(
      title: 'CRMs',
      image: 'assets/svg/project.svg',
      trailing: const SwitchWidget(value: true),
    ),
    SettingModel(
      title: 'Finance',
      trailing: const SwitchWidget(value: true),

      image: 'assets/svg/dollar.svg',
    ),
  ];
  final List<SettingModel> systemSettingItem = [
    SettingModel(title: 'Calender', image: 'assets/svg/date.svg'),
    SettingModel(title: 'Languages', icon: Icons.language),
    SettingModel(
      title: 'Light Mode /Dark',
      trailing: const SwitchWidget(value: true),
      image: 'assets/svg/darktheme.svg',
    ),
  ];

  final List<SettingModel> _extraInfoItem = [
    SettingModel(title: 'Help', icon: Icons.info_outline),
    SettingModel(
      title: 'Privacy Center',
      image: 'assets/svg/privacypolicy.svg',
    ),
    SettingModel(title: 'About', image: 'assets/svg/about.svg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        centerTitle: false,
        title: Text(
          'Settings and Activity',
          style: context.textTheme.bodyLarge?.copyWith(fontSize: 16),
        ),
      ),
      body: ListView(
        children: [
          GeneralContainer(
            borderRadius: BorderRadius.circular(myPadding / 2),
            margin: const EdgeInsetsGeometry.symmetric(horizontal: myPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _title('Manage your business Account'),
                ListTile(
                  onTap: () {
                    selectAccount(context);
                  },
                  contentPadding: const EdgeInsets.all(0),
                  dense: true,
                  title: Text(
                    'Account Center',
                    style: context.textTheme.bodyMedium,
                  ),
                  trailing: const Icon(CupertinoIcons.forward),
                  subtitle: Text(
                    'Manage your business and business details',
                    style: context.textTheme.labelSmall,
                    maxLines: 1,
                  ),
                  leading: SvgPicture.asset('assets/svg/profile.svg'),
                ),

                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ManageBusinessScreen(),
                      ),
                    );
                  },
                  dense: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 4),
                  title: Text(
                    'Manage your current business',
                    style: context.textTheme.bodyMedium,
                    // maxLines: 1,
                  ),
                  trailing: const Icon(CupertinoIcons.forward),
                  leading: const Icon(Icons.business),
                ),
              ],
            ),
          ),

          _businessSetting(),

          _systemSettings(),
          _moreInfo(),
        ],
      ),
    );
  }

  Widget _title(String title) {
    return Text(
      title,
      style: context.textTheme.bodyMedium?.copyWith(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: MyColors.textColor.withValues(alpha: 0.7),
      ),
    );
  }

  Widget _moreInfo() {
    return _bgContainer(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title('More Info And Support'),
          const SizedBox(height: myPadding / 2),
          ...List.generate(
            _extraInfoItem.length,
            (index) => SettingItemTile(settingModel: _extraInfoItem[index]),
          ),
          _logout(),
        ],
      ),
    );
  }

  Widget _bgContainer(Widget child) {
    return GeneralContainer(
      borderRadius: BorderRadius.circular(myPadding / 2),
      margin: const EdgeInsets.symmetric(
        horizontal: myPadding,
        vertical: myPadding / 1.5,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: myPadding,
        vertical: myPadding / 2,
      ),
      child: child,
    );
  }

  Widget _systemSettings() {
    return _bgContainer(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title('System Setting'),
          const SizedBox(height: myPadding / 2),
          ...List.generate(
            systemSettingItem.length,
            (index) => SettingItemTile(settingModel: systemSettingItem[index]),
          ),
        ],
      ),
    );
  }

  Widget _businessSetting() {
    return _bgContainer(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title('Business Setting'),
          const SizedBox(height: myPadding / 2),
          ...List.generate(
            settingItems.length,
            (index) => SettingItemTile(settingModel: settingItems[index]),
          ),
        ],
      ),
    );
  }

  Widget _logout() {
    return ListTile(
      horizontalTitleGap: 6,
      contentPadding: const EdgeInsets.all(0),
      onTap: () {},
      title: Text(
        'Log Out',
        style: context.textTheme.bodyMedium?.copyWith(color: Colors.red),
      ),
      leading: SvgPicture.asset(
        'assets/svg/logout.svg',
        colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn),
      ),

      trailing: const Icon(
        size: 15,
        Icons.arrow_forward_ios_sharp,
        color: Colors.black87,
      ),
    );
  }
}
