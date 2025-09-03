import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:assign_in/src/core/features/accountant/screens/accountant_screen.dart';
import 'package:assign_in/src/core/features/admin_dashboard/screens/admin_dashboard.dart';
import 'package:assign_in/src/core/features/crm/screens/crm_screen.dart';
import 'package:assign_in/src/core/features/overview/screens/overview.dart';
import 'package:assign_in/src/core/features/settings/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});
  static const routeName = '/nav-bar';

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;
  bool isSelected = false;

  final List<Widget> _screens = const [
    OverviewScreen(),
    AdminDashboard(),
    AccountantScreen(),
    CRMScreen(),
    SettingScreen(),
  ];

  final List<_NavItem> _navItems = [
    const _NavItem(
      label: 'Overview',
      activeSvg: 'assets/svg/dashboard.svg',
      inactiveSvg: 'assets/svg/mage_dashboard.svg',
    ),
    const _NavItem(
      label: 'HR',
      activeSvg: 'assets/svg/bag.svg',
      icon: Icons.business_center_outlined,
    ),
    const _NavItem(
      label: 'Accountant',
      activeSvg: 'assets/svg/team.svg',
      inactiveSvg: 'assets/svg/team.svg',
      icon: Icons.groups_outlined,
    ),
    const _NavItem(
      label: 'CRM',
      activeSvg: 'assets/svg/dollar.svg',
      inactiveSvg: 'assets/svg/dollar.svg',
    ),
    const _NavItem(
      label: 'Settings',
      activeSvg: 'assets/svg/settings.svg',
      icon: Icons.settings_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
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

        // selectedItemColor: Colors.green,
        // unselectedItemColor: Colors.red,

        // onTap: (index) => setState(() {
        //   _selectedIndex = index;
        //   isSelected = true;
        // }),
        // items: _navItems.map((w) {
        //   return
        //    BottomNavigationBarItem(
        //     icon: isSelected
        //         ? ShaderMask(
        //             shaderCallback: (bounds) => LinearGradient(
        //               begin: Alignment.topLeft,
        //               end: Alignment.bottomRight,
        //               colors: [
        //                 MyColors.gradient3,
        //                 MyColors.gradient2,
        //                 MyColors.gradientColor1,
        //               ],
        //             ).createShader(bounds),
        //             blendMode: BlendMode.srcIn,
        //             child: SvgPicture.asset(
        //               isSelected ? w.activeSvg! : w.inactiveSvg ?? w.activeSvg!,
        //               height: 26,
        //               width: 26,
        //             ),
        //           )
        //         : SvgPicture.asset(
        //             w.inactiveSvg ?? w.activeSvg!,
        //             height: 26,
        //             width: 26,
        //             colorFilter: const ColorFilter.mode(
        //               Colors.grey,
        //               BlendMode.srcIn,
        //             ),
        //           ),

        //     label: w.label,
        //   );
        // }).toList(),
        child: SafeArea(
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
                    if (item.activeSvg != null || item.inactiveSvg != null) ...[
                      isSelected
                          ? ShaderMask(
                              shaderCallback: (bounds) => LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  MyColors.gradient3,
                                  MyColors.gradient2,
                                  MyColors.gradientColor1,
                                ],
                              ).createShader(bounds),
                              blendMode: BlendMode.srcIn,
                              child: SvgPicture.asset(
                                isSelected
                                    ? item.activeSvg!
                                    : item.inactiveSvg ?? item.activeSvg!,
                                height: 26,
                                width: 26,
                              ),
                            )
                          : SvgPicture.asset(
                              item.inactiveSvg ?? item.activeSvg!,
                              height: 26,
                              width: 26,
                              colorFilter: const ColorFilter.mode(
                                Colors.grey,
                                BlendMode.srcIn,
                              ),
                            ),
                    ] else if (item.icon != null) ...[
                      isSelected
                          ? ShaderMask(
                              shaderCallback: (bounds) => LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  MyColors.gradientColor1,
                                  MyColors.gradient2,
                                ],
                              ).createShader(bounds),
                              blendMode: BlendMode.srcIn,
                              child: Icon(
                                item.icon,
                                size: 26,
                                color: Colors.white,
                              ),
                            )
                          : Icon(item.icon, size: 26, color: Colors.grey),
                    ],
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
      ),
    );
  }
}

class _NavItem {
  final String label;
  final IconData? icon;
  final String? activeSvg;
  final String? inactiveSvg;

  const _NavItem({
    required this.label,
    this.icon,
    this.activeSvg,
    this.inactiveSvg,
  });
}
