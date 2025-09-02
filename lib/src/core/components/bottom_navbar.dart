import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:assign_in/src/core/features/accountant/screens/accountant_screen.dart';
import 'package:assign_in/src/core/features/admin_dashboard/screens/admin_dashboard.dart';
import 'package:assign_in/src/core/features/crm/screens/crm_screen.dart';
import 'package:assign_in/src/core/features/overview/screens/overview.dart';
import 'package:assign_in/src/core/features/settings/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});
  static const routeName = '/BottomNavbar';

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  late PersistentTabController _controller;
  bool isSelected = false;

  @override
  void initState() {
    super.initState();

    _controller = PersistentTabController(initialIndex: 0);
    setState(() {
      isSelected = true;
    });
  }

  List<Widget> _buildScreens() {
    return const [
      OverviewScreen(),
      AdminDashboard(),
      AccountantScreen(),
      CRMScreen(),
      SettingScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/svg/dashboard.svg',
          colorFilter: ColorFilter.mode(Colors.grey.shade500, BlendMode.srcIn),
        ),
        title: 'OverView',

        contentPadding: 0,

        inactiveColorPrimary: Colors.grey,
        textStyle: context.textTheme.bodyMedium?.copyWith(fontSize: 14),
      ),
      PersistentBottomNavBarItem(
        contentPadding: 0,
        icon: const Icon(Icons.person_outline_outlined),
        title: 'HR',
        activeColorPrimary: MyColors.gradientColor1,
        textStyle: context.textTheme.bodyMedium,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('assets/svg/finance.svg'),
        title: 'Accountant',
        contentPadding: 0,

        activeColorPrimary: MyColors.gradientColor1,
        inactiveColorPrimary: Colors.grey,
        textStyle: context.textTheme.bodyMedium,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/svg/dollar.svg',
          // colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
        ),
        title: 'CRM',
        contentPadding: 0,

        activeColorPrimary: MyColors.gradientColor1,
        inactiveColorPrimary: Colors.grey,
        textStyle: context.textTheme.bodyMedium,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings_outlined),
        title: 'Settings',
        contentPadding: 0,
        textStyle: context.textTheme.bodyMedium,
        activeColorPrimary: MyColors.gradientColor1,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      navBarHeight: 80,
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      padding: const EdgeInsets.all(6),

      decoration: NavBarDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 10,
            offset: const Offset(1, 2),
            spreadRadius: 4, // Color(0xFF0c96d7)
            //  Color(0xFF2bd0b0)
          ),
        ],

        borderRadius: BorderRadius.circular(12),
        colorBehindNavBar: Colors.grey.shade100,
      ),
      confineToSafeArea: false,

      navBarStyle: NavBarStyle.simple,
      isVisible: true,
    );
  }
}
