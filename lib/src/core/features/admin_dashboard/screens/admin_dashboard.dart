import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:assign_in/src/core/features/admin_dashboard/components/bottom_sheet_data.dart';
import 'package:assign_in/src/core/features/admin_dashboard/components/deals_card.dart';
import 'package:assign_in/src/core/features/admin_dashboard/components/employee_cards.dart';
import 'package:assign_in/src/core/features/admin_dashboard/components/finance_graph.dart';
import 'package:assign_in/src/core/features/overview/components/app_bar_widget.dart';
import 'package:flutter/material.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});
  static const routeName = '/admin-dashboard';

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const AppBarWidget(
            image: 'assets/images/beta.png',
            title: 'Beta CO',
            subTitle: 'Admin',
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: myPadding,
                vertical: myPadding / 2,
              ),
              child: Text(
                'Good Morning, Sarah! 👋',
                style: context.textTheme.bodyLarge?.copyWith(fontSize: 15),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: myPadding),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.green.shade500,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '15 Employees Active Today',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: MyColors.textColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(child: EmployeeCardGrid()),

          _title('Finance Snapshot'),
          const SliverToBoxAdapter(child: FinanceGraph()),

          _title('Deals Due This Week'),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => const DealsCard(),
              childCount: 5,
            ),
          ),
        ],
      ),
      floatingActionButton: _addButton(),
    );
  }

  Widget _addButton() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [MyColors.mainCOlor, MyColors.gradientColor],
        ),
        boxShadow: const [
          BoxShadow(
            spreadRadius: 2,
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: FloatingActionButton(
        onPressed: () {
          showItemsList(context);
        },
        elevation: 0,
        backgroundColor: Colors.transparent,
        highlightElevation: 0,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _title(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: myPadding),
        child: Text(
          title,
          style: context.textTheme.bodyLarge?.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
