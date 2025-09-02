import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPress,
    this.loading = false,
  });
  final String text;
  final Function()? onPress;
  final bool loading;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: loading ? () {} : onPress,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(context.width, 45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(myPadding),
        ),
        backgroundColor: loading ? Colors.grey : MyColors.primaryColor,
      ),
      child: loading
          ? const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: myPadding * 2,
                  vertical: 4,
                ),
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.5,
                ),
              ),
            )
          : Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}
