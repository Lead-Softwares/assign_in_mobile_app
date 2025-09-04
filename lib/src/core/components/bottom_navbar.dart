import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/components/app_icon_widget.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:assign_in/src/core/features/accountant/screens/accountant_screen.dart';
import 'package:assign_in/src/core/features/admin_dashboard/screens/admin_dashboard.dart';
import 'package:assign_in/src/core/features/crm/screens/crm_screen.dart';
import 'package:assign_in/src/core/features/overview/screens/overview.dart';
import 'package:assign_in/src/core/features/settings/screens/settings.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});
  static const routeName = '/nav-bar';
  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;
  final List<Widget> _screens = const [
    OverviewScreen(),
    AdminDashboard(),
    AccountantScreen(),
    CRMScreen(),
    SettingScreen(),
  ];

  final List<NavItem> _navItems = const [
    NavItem(
      label: 'Overview',
      activeSvg: 'assets/svg/dashboard.svg',
      inactiveSvg: 'assets/svg/mage_dashboard.svg',
    ),
    NavItem(
      label: 'HR',
      activeSvg: 'assets/svg/bag.svg',
      icon: Icons.business_center_outlined,
    ),
    NavItem(
      label: 'Accountant',
      activeSvg: 'assets/svg/team.svg',
      inactiveSvg: 'assets/svg/team.svg',
      icon: Icons.groups_outlined,
    ),
    NavItem(
      label: 'CRM',
      activeSvg: 'assets/svg/dollar.svg',
      inactiveSvg: 'assets/svg/dollar.svg',
    ),
    NavItem(
      label: 'Settings',
      activeSvg: 'assets/svg/settings.svg',
      icon: Icons.settings_outlined,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: Container(
        height: 76,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(myPadding),
            topRight: Radius.circular(myPadding),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_navItems.length, (index) {
            final isSelected = _selectedIndex == index;
            final item = _navItems[index];
            return GestureDetector(
              onTap: () => setState(() => _selectedIndex = index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppIconWidget(isSelected: isSelected, item: item),
                  const SizedBox(height: 4),
                  Text(
                    item.label,
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontSize: 12,
                      color: isSelected ? Colors.black : Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

class NavItem {
  final String label;
  final IconData? icon;
  final String? activeSvg;
  final String? inactiveSvg;

  const NavItem({
    required this.label,
    this.icon,
    this.activeSvg,
    this.inactiveSvg,
  });
}
