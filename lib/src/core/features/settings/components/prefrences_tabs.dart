import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/components/general_container.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:assign_in/src/core/features/settings/components/tabs_components/prefrence_general_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrefrencesTabs extends StatefulWidget {
  const PrefrencesTabs({super.key});

  @override
  State<PrefrencesTabs> createState() => _PrefrencesTabsState();
}

class _PrefrencesTabsState extends State<PrefrencesTabs>
    with TickerProviderStateMixin {
  late TabController _controller;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
    _controller.addListener(() {
      setState(() {
        selectedIndex = _controller.index;
      });
    });
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
          padding: const EdgeInsetsGeometry.all(myPadding / 2),
          borderRadius: BorderRadius.circular(myPadding / 1.5),
          // border: Border.all(color: Colors.grey.shade300),
          color: Colors.grey.shade200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(4, (index) {
              final isActive = selectedIndex == index;
              return Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    _controller.animateTo(index);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,

                    margin: const EdgeInsetsGeometry.all(0),

                    decoration: BoxDecoration(
                      color: isActive ? Colors.white : Colors.grey.shade200,
                      boxShadow: [
                        isActive
                            ? BoxShadow(
                                blurRadius: 7,
                                spreadRadius: 2,
                                offset: const Offset(0.5, 1),
                                color: Colors.grey.shade300,
                              )
                            : const BoxShadow(),
                      ],
                      borderRadius: BorderRadius.circular(myPadding / 1.5),
                    ),
                    child: _tabItem(
                      index == 0
                          ? Icons.settings_outlined
                          : index == 2
                          ? Icons.graphic_eq_sharp
                          : null,
                      index == 1
                          ? 'assets/svg/project.svg'
                          : index == 2
                          ? 'assets/svg/graph.svg'
                          : null,
                      index == 0
                          ? 'general'
                          : index == 1
                          ? 'Payrolls'
                          : index == 2
                          ? 'other'
                          : '',
                      isActive,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 10),

        SizedBox(
          height: context.height * 2,
          child: TabBarView(
            controller: _controller,
            children: const [PrefrenceGeneralTab(), SizedBox(), SizedBox()],
          ),
        ),
      ],
    );
  }

  Widget _tabItem(
    IconData? icon,
    String? image,
    String title,
    bool isSelected,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        (image != null)
            ? SvgPicture.asset(
                image,
                height: 16,
                width: 16,
                colorFilter: ColorFilter.mode(
                  isSelected ? Colors.black : MyColors.textColor,
                  BlendMode.srcIn,
                ),
              )
            : (icon != null)
            ? Icon(
                icon,
                color: isSelected ? Colors.black : Colors.grey.shade700,
                size: 16,
              )
            : const SizedBox.shrink(),
        const SizedBox(height: myPadding / 4),
        Text(
          title,
          style: context.textTheme.bodyMedium?.copyWith(
            fontSize: 9,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w100,
            color: isSelected ? Colors.black : MyColors.textColor,
          ),
        ),
      ],
    );
  }
}
