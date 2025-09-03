import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/components/general_container.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class SecurityNoticeWidget extends StatelessWidget {
  const SecurityNoticeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralContainer(
      color: Colors.orange.shade50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Icon(
              Icons.warning_rounded,
              color: Colors.orange.shade500,
              size: 26,
            ),
          ),
          const SizedBox(width: myPadding / 2),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Security Notice',
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: Colors.orange.shade500,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'All payment integrations use industry-standard encryption. Your customers'
                  'payment information is never stored on our servers.',
                  style: context.textTheme.bodySmall?.copyWith(
                    color: Colors.orange.shade500,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
