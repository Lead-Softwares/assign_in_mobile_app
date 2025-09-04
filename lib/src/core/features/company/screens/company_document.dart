import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/components/general_container.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CompanyDocuments extends StatelessWidget {
  const CompanyDocuments({super.key});
  static const routeName = '/company-docs';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Company Documents', style: context.textTheme.bodyLarge),
      ),
      body: ListView(
        padding: const EdgeInsets.all(myPadding),
        shrinkWrap: true,
        children: [
          Text(
            'Files',
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: myPadding / 2),
          const DocumentTile(
            image: 'assets/svg/pdf.svg',
            title: 'HR Policy',
            type: 'PDF . 8 Sept',
          ),
          const DocumentTile(
            image: 'assets/svg/docs.svg',
            title: 'Contract',
            type: 'Docx . 8 Sept',
          ),
          const DocumentTile(
            image: 'assets/svg/xlr.svg',
            title: 'Salary Report',
            type: 'XSL . 8 Sept',
          ),
          // ...List.generate(2, (index) => const DocumentTile()),
        ],
      ),
    );
  }
}

class DocumentTile extends StatelessWidget {
  const DocumentTile({
    super.key,
    required this.title,
    required this.image,
    required this.type,
    this.onTap,
  });
  final String title;
  final String image;
  final String type;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GeneralContainer(
      color: Colors.grey.shade50,
      borderRadius: BorderRadius.circular(myPadding / 2),
      border: Border.all(color: Colors.grey.shade200),
      child: Row(
        children: [
          Container(
            height: 45,
            width: 45,
            padding: const EdgeInsets.all(myPadding / 2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue.shade100.withValues(alpha: 0.5),
              border: Border.all(color: const Color(0xFF2063cd)),
            ),
            child: SvgPicture.asset(
              image,

              // 'assets/svg/dollar.svg',
              colorFilter: ColorFilter.mode(
                MyColors.mainCOlor,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(width: myPadding),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  // 'HR Policy',
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: myPadding / 6),
                Text(
                  type,
                  // 'PDF. 8 Sept',
                  style: context.textTheme.bodySmall?.copyWith(
                    color: MyColors.textColor,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: SvgPicture.asset(
              'assets/svg/download.svg',
              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
          ),
        ],
      ),
    );
  }
}
