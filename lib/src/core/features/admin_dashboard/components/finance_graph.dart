import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/components/general_container.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FinanceGraph extends StatefulWidget {
  const FinanceGraph({super.key});

  @override
  State<FinanceGraph> createState() => _FinanceGraphState();
}

class _FinanceGraphState extends State<FinanceGraph> {
  @override
  Widget build(BuildContext context) {
    return GeneralContainer(
      margin: const EdgeInsets.symmetric(
        horizontal: myPadding,
        vertical: myPadding / 2,
      ),
      // height: context.height / 3,
      border: BoxBorder.all(color: Colors.grey.shade300),
      child: Column(children: [_toSection(), const FLBarWithVerticalGrid()]),
    );
  }

  Widget _toSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                text: 'Total Expenses\n',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: '\$6500',
                style: context.textTheme.bodyLarge?.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        GeneralContainer(
          height: myPadding * 2.5,
          width: context.width / 3.2,
          padding: const EdgeInsets.symmetric(
            horizontal: myPadding / 2,
            vertical: myPadding / 4,
          ),
          borderRadius: BorderRadius.circular(myPadding * 2),
          border: Border.all(color: Colors.grey.shade200),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              borderRadius: BorderRadius.circular(myPadding / 2),
              value: 'Mar 12,',
              style: context.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
              ),
              // icon: const Icon(
              //   Icons.arrow_drop_down_rounded,
              //   color: Colors.black87,
              // ),
              items: const [
                DropdownMenuItem(value: 'Mar 12,', child: Text('Mar 12,')),
                DropdownMenuItem(value: 'Mar 13,', child: Text('Mar 13,')),
                DropdownMenuItem(value: 'Mar 14,', child: Text('Mar 14,')),
              ],
              onChanged: (value) {},
            ),
          ),
        ),
      ],
    );
  }
}

class FLBarWithVerticalGrid extends StatefulWidget {
  const FLBarWithVerticalGrid({super.key});

  @override
  State<FLBarWithVerticalGrid> createState() => _FLBarWithVerticalGridState();
}

class _FLBarWithVerticalGridState extends State<FLBarWithVerticalGrid> {
  final bars = [
    8500.0,
    7500.0,
    6500.0,
    8600.0,
    6900.0,
    3000.0,
    9700.0,
    8600.0,
    6900.0,
  ];

  int? touchedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 200,
        child: BarChart(
          BarChartData(
            barTouchData: BarTouchData(
              enabled: true,
              touchTooltipData: BarTouchTooltipData(
                getTooltipColor: (group) => Colors.white,
                tooltipBorder: BorderSide(
                  color: Colors.grey.shade200,
                  width: 1.5,
                ),
                tooltipBorderRadius: BorderRadius.circular(myPadding / 2),

                getTooltipItem: (group, groupIndex, rod, rodIndex) {
                  final value = rod.toY.toInt();
                  return BarTooltipItem(
                    textAlign: TextAlign.start,
                    children: [
                      TextSpan(
                        text: 'Expenses\n',
                        style: TextStyle(
                          color: MyColors.textColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: '\$$value',
                        style: TextStyle(
                          color: MyColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                    '',
                    TextStyle(
                      color: MyColors.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),

              touchCallback: (event, response) {
                if (response != null && response.spot != null) {
                  setState(() {
                    touchedIndex = response.spot!.touchedBarGroupIndex;
                  });
                } else {
                  setState(() {
                    touchedIndex = null;
                  });
                }
              },
            ),
            gridData: const FlGridData(show: false),
            titlesData: FlTitlesData(
              leftTitles: const AxisTitles(),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, _) {
                    const labels = [
                      'Mon',
                      'Tue',
                      'Wed',
                      'Thu',
                      'Fri',
                      'Sat',
                      'Sun',
                      'Mon',
                      'Tue',
                    ];
                    final i = value.toInt();
                    return Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        i >= 0 && i < labels.length ? labels[i] : '',
                        style: context.textTheme.bodySmall?.copyWith(
                          color: MyColors.textColor,
                          fontSize: 10,
                        ),
                      ),
                    );
                  },
                ),
              ),
              rightTitles: const AxisTitles(),
              topTitles: const AxisTitles(),
            ),
            borderData: FlBorderData(show: false),
            barGroups: List.generate(bars.length, (i) {
              final isSelected = touchedIndex == i;
              return BarChartGroupData(
                barsSpace: 10,
                x: i,
                barRods: [
                  BarChartRodData(
                    toY: bars[i],
                    gradient: isSelected
                        ? LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              const Color(0xFF144cc5),
                              const Color(0xFF6367ef).withValues(alpha: 0.9),
                            ],
                          )
                        : LinearGradient(
                            colors: [
                              MyColors.secondaryColor,
                              MyColors.secondaryColor,
                            ],
                          ),
                    width: 18,
                    color: isSelected
                        ? MyColors.primaryColor
                        : MyColors.secondaryColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
