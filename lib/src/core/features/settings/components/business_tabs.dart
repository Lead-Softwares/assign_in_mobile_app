import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/components/general_container.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:assign_in/src/core/features/settings/screens/billing_details.dart';
import 'package:assign_in/src/core/features/settings/screens/business_details.dart';
import 'package:assign_in/src/core/features/settings/screens/integration_details.dart';
import 'package:assign_in/src/core/features/settings/screens/social_details.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BusinessTabs extends StatefulWidget {
  const BusinessTabs({super.key});

  @override
  State<BusinessTabs> createState() => _BusinessTabsState();
}

class _BusinessTabsState extends State<BusinessTabs>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GeneralContainer(
          borderRadius: BorderRadius.circular(myPadding / 1.5),
          color: Colors.grey.shade200,
          child: ButtonsTabBar(
            borderColor: Colors.grey.shade300,
            radius: myPadding / 2,
            splashColor: Colors.white,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(myPadding / 2),
              color: Colors.white,

              boxShadow: [
                BoxShadow(
                  blurRadius: 6,
                  offset: const Offset(3, 4),
                  color: Colors.grey.shade300,
                  spreadRadius: 20,
                ),
              ],
            ),
            controller: _controller,

            unselectedBackgroundColor: Colors.grey.shade200,

            contentCenter: true,

            width: context.width / 4.2,
            tabs: [
              Tab(child: _tabItem(null, 'assets/svg/business.svg', 'Business')),
              Tab(child: _tabItem(Icons.ios_share, null, 'Social')),
              Tab(
                child: _tabItem(
                  null,
                  'assets/svg/stash_integrations.svg',
                  'Integration',
                ),
              ),
              Tab(
                child: _tabItem(
                  null,
                  'assets/svg/stash_billing-info.svg',
                  'Billing',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),

        SizedBox(
          height: context.height,
          child: TabBarView(
            controller: _controller,
            children: [
              const BusinessDetails(),
              const SocialDetails(),
              const IntegrationDetails(),
              const BillingDetails(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _tabItem(IconData? icon, String? image, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        (image != null)
            ? SvgPicture.asset(
                image,
                height: 16,
                width: 16,
                colorFilter: const ColorFilter.mode(
                  Colors.black,
                  BlendMode.srcIn,
                ),
              )
            : (icon != null)
            ? Icon(icon, color: Colors.grey.shade700, size: 16)
            : const SizedBox.shrink(),
        Text(
          title,
          style: context.textTheme.bodyMedium?.copyWith(fontSize: 12),
        ),
      ],
    );
  }
}
