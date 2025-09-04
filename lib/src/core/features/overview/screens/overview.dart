import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:assign_in/src/core/features/admin_dashboard/screens/admin_dashboard.dart';
import 'package:assign_in/src/core/features/overview/components/app_bar_widget.dart';
import 'package:assign_in/src/core/features/overview/components/recent_projects.dart';
import 'package:assign_in/src/core/features/overview/components/task_tabs_data.dart';
import 'package:assign_in/src/core/features/overview/components/today_overview.dart';
import 'package:assign_in/src/core/features/overview/model/project_model.dart';
import 'package:flutter/material.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});
  static const routeName = '/over-view';

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  List<Color> colors = [
    const Color(0xFFdcff40),
    const Color(0xFF9de2ff),
    const Color(0xFfb4e3ff),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          const AppBarWidget(
            image: 'assets/images/Ellipse 1.png',
            title: 'ACME Corp',
            subTitle: 'HR Manager',
          ),

          const SliverToBoxAdapter(child: TodayOverview()),
          const SliverToBoxAdapter(child: SizedBox(height: myPadding / 3)),
          SliverToBoxAdapter(child: _title('Recent projects')),

          const SliverToBoxAdapter(child: SizedBox(height: myPadding / 3)),
          SliverToBoxAdapter(
            child: SizedBox(
              height: myPadding * 13.5,
              child: ListView.builder(
                itemCount: ProjectModel.projectData.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: myPadding / 3),
                itemBuilder: (context, index) {
                  final projectData = ProjectModel.projectData[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: RecentProjectCard(projectModel: projectData),
                  );
                },
              ),
            ),
          ),

          SliverToBoxAdapter(child: _title('Your Tasks')),
          const SliverToBoxAdapter(child: TaskTabsData()),
        ],
      ),
      floatingActionButton: _addButton(),
    );
  }

  Widget _addButton() {
    return Container(
      width: 45,
      height: 45,
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
          Navigator.pushNamed(context, AdminDashboard.routeName);
        },
        elevation: 0,

        backgroundColor: Colors.transparent,
        highlightElevation: 0,
        shape: const CircleBorder(),
        mini: true,
        heroTag: 'Overview screen',
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _title(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: myPadding / 1.5,
        vertical: myPadding / 2,
      ),
      child: Text(
        title,
        style: context.textTheme.bodyLarge?.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
