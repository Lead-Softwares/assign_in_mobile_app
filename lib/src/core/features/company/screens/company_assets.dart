import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/components/text_feild_with_title.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:assign_in/src/core/features/company/components/assets_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CompanyAssets extends StatefulWidget {
  const CompanyAssets({super.key});
  static const routeName = '/company-assets';

  @override
  State<CompanyAssets> createState() => _CompanyAssetsState();
}

class _CompanyAssetsState extends State<CompanyAssets> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Company Assets', style: context.textTheme.bodyLarge),
      ),
      body: ListView(
        padding: const EdgeInsets.all(myPadding),
        shrinkWrap: true,
        children: [
          Row(
            children: [
              Expanded(
                child: TextFeildWithTitle(
                  label: 'Search assets',
                  hintStyle: context.textTheme.bodyMedium?.copyWith(
                    color: MyColors.textColor,
                  ),
                  prefix: const Icon(Icons.search_rounded),
                  controller: controller,
                ),
              ),
              const SizedBox(width: myPadding / 2),
              Container(
                height: 45,
                width: 45,
                padding: const EdgeInsets.all(myPadding / 1.7),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      MyColors.primaryColor,
                      MyColors.primaryColor,
                      Colors.purple.shade300.withValues(alpha: 0.9),
                    ],
                    begin: AlignmentGeometry.topLeft,
                    end: AlignmentGeometry.bottomRight,
                  ),

                  borderRadius: BorderRadius.circular(myPadding / 1.5),
                ),
                child: SvgPicture.asset('assets/svg/mage_filter.svg'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: myPadding / 4,
              vertical: myPadding / 2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '20 Results',
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'clear filter x',
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          ...List.generate(4, (index) => const AssetCard()),
        ],
      ),
    );
  }
}
