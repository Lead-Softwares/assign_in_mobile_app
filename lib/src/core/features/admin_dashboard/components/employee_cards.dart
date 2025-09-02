import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/components/general_container.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmployeeCardGrid extends StatefulWidget {
  const EmployeeCardGrid({super.key});

  @override
  State<EmployeeCardGrid> createState() => _EmployeeCardGridState();
}

class _EmployeeCardGridState extends State<EmployeeCardGrid> {
  final List<CardModel> cardData = [
    CardModel(
      title: 'Employee Present',
      count: 25,
      image: 'assets/svg/person.svg',
      cardColor: Colors.green.shade50,
      date: 'Mar 25, 2025',
      iconCOlor: Colors.green.shade700,
    ),
    CardModel(
      title: 'Absent',
      count: 03,
      image: 'assets/svg/emoji.svg',
      cardColor: Colors.red.shade50,
      date: 'Mar 25, 2025',
      iconCOlor: Colors.red.shade700,
    ),
    CardModel(
      title: 'On Leave',
      count: 02,
      image: 'assets/svg/leave.svg',
      cardColor: Colors.yellow.shade50,
      date: 'Mar 25, 2025',
      iconCOlor: Colors.yellow.shade700,
    ),
    CardModel(
      title: 'Pending Approvals',
      count: 25,
      image: 'assets/svg/clock.svg',
      cardColor: const Color(0xFfd8e3f5),
      date: 'Mar 25, 2025',
      iconCOlor: Colors.blue.shade700,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 4,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(
        horizontal: myPadding,
        vertical: myPadding / 2,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: myPadding,

        childAspectRatio: 1.25,
      ),
      itemBuilder: (context, index) {
        final card = cardData[index];

        return EmployeeCard(cardModel: card);
      },
    );
  }
}

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({super.key, required this.cardModel});
  final CardModel cardModel;

  @override
  Widget build(BuildContext context) {
    return GeneralContainer(
      padding: const EdgeInsets.all(myPadding / 2),
      color: cardModel.cardColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cardModel.count.toString(),
                style: context.textTheme.bodyLarge,
              ),

              CircleAvatar(
                radius: 14,
                backgroundColor: cardModel.iconCOlor.withValues(alpha: 0.2),
                child: _iconData(),
              ),
            ],
          ),

          const SizedBox(height: myPadding),
          Text(
            cardModel.title,
            style: context.textTheme.bodyMedium?.copyWith(fontSize: 12),
          ),
          Text(
            cardModel.date,
            style: context.textTheme.bodySmall?.copyWith(
              color: MyColors.textColor,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconData() {
    if (cardModel.image != null) {
      return SvgPicture.asset(
        cardModel.image!,
        height: 16,
        width: 16,
        colorFilter: ColorFilter.mode(cardModel.iconCOlor, BlendMode.srcIn),
      );
    } else if (cardModel.icon != null) {
      return Icon(cardModel.icon, color: cardModel.iconCOlor, size: 16);
    }
    return const SizedBox.shrink();
  }
}

class CardModel {
  CardModel({
    required this.title,
    required this.count,
    this.icon,
    this.image,
    required this.cardColor,
    required this.date,
    required this.iconCOlor,
  });

  final String title;
  final int count;
  final IconData? icon;
  final Color cardColor;
  final String date;
  final String? image;
  final Color iconCOlor;
}
