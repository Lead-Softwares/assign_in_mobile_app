import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/components/general_container.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class DateFormatCard extends StatefulWidget {
  const DateFormatCard({
    super.key,
    required this.subTitle,
    required this.title,
  });
  final String title;
  final String subTitle;

  @override
  State<DateFormatCard> createState() => _DateFormatCardState();
}

class _DateFormatCardState extends State<DateFormatCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: GeneralContainer(
        padding: const EdgeInsetsGeometry.all(myPadding),
        gradient: isSelected == false
            ? const LinearGradient(colors: [Colors.white, Colors.white])
            : LinearGradient(
                colors: [
                  const Color(0xFF7f43e8),
                  MyColors.primaryColor,

                  Colors.blue.shade400,
                ],
              ),
        border: Border.all(
          color: isSelected ? Colors.white : Colors.grey.shade200,
          width: 1.5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: isSelected ? Colors.white : Colors.black87,
                  ),
                ),
                Text(
                  widget.subTitle,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: isSelected ? Colors.white : MyColors.textColor,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.radio_button_checked,
              color: isSelected ? Colors.green.shade400 : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

class DateFormatWidget extends StatelessWidget {
  const DateFormatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        DateFormatCard(title: 'MM/DD/YYYY', subTitle: 'US  Format'),
        DateFormatCard(title: 'DD/MM/YYYY', subTitle: 'European  Format'),
        DateFormatCard(title: 'YYYY/MM/DD', subTitle: 'ISo  Format'),
        DateFormatCard(title: 'Month/DD/YYYY', subTitle: 'Long  Format'),
      ],
    );
  }
}
