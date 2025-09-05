import 'package:assign_in/src/core/components/bottom_navbar.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:assign_in/src/core/features/accountant/screens/accountant_screen.dart';
import 'package:assign_in/src/core/features/admin_dashboard/screens/admin_dashboard.dart';
import 'package:assign_in/src/core/features/company/screens/company_assets.dart';
import 'package:assign_in/src/core/features/company/screens/company_document.dart';
import 'package:assign_in/src/core/features/company/screens/company_profile.dart';
import 'package:assign_in/src/core/features/hr_dashboard/screens/hr_dashboard_screen.dart';
import 'package:assign_in/src/core/features/overview/screens/overview.dart';
import 'package:assign_in/src/core/features/settings/screens/calender_screen.dart';
import 'package:assign_in/src/core/features/settings/screens/manage_business.dart';
import 'package:assign_in/src/core/features/settings/screens/prefreneces_screen.dart';
import 'package:assign_in/src/core/features/settings/screens/settings.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case BottomNavbar.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const BottomNavbar(),
        );

      case AccountantScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const AccountantScreen(),
        );
      case SettingScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SettingScreen(),
        );
      case HrDashboard.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const HrDashboard(),
        );
      case CompanyAssets.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const CompanyAssets(),
        );
      case CompanyDocuments.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const CompanyDocuments(),
        );
      case CompanyProfile.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const CompanyProfile(),
        );
      case PrefrenecesScreen.routeName:
        return MaterialPageRoute(
          settings: settings,

          builder: (context) => const PrefrenecesScreen(),
        );
      case CalenderScreen.routeName:
        return MaterialPageRoute( settings: settings,
          builder: (context) => const CalenderScreen());
      case AdminDashboard.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const AdminDashboard(),
        );
      case OverviewScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const OverviewScreen(),
        );
      case ManageBusinessScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const ManageBusinessScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const NotFoundRoute(),
          settings: settings,
        );
    }
  }
}

class NotFoundRoute extends StatelessWidget {
  const NotFoundRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '404',
              style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            Text('Page Not Found', style: context.textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
