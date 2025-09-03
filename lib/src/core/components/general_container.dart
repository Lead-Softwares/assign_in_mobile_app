import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../config/theme_data.dart';

class GeneralContainer extends StatelessWidget {
  const GeneralContainer({
    super.key,
    this.height,
    this.width,
    this.margin = const EdgeInsets.symmetric(vertical: myPadding / 2),
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    required this.child,
    this.color = Colors.white,
    this.borderRadius = const BorderRadius.all(Radius.circular(myPadding)),
    this.boxShadow,
    this.gradient,
    this.border,
  });
  final double? height;
  final double? width;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final Widget child;
  final Color color;
  final BorderRadius borderRadius;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: margin,
      padding: padding,
      width: width ?? context.width,
      decoration: BoxDecoration(
        border: border,
        gradient: gradient,
        borderRadius: borderRadius,
        color: color,
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}

class SwitchWidget extends StatelessWidget {
  const SwitchWidget({super.key, required this.value, this.onChanged});

  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.7,
      child: Switch(
        value: value,
        onChanged: onChanged,
        thumbColor: WidgetStateProperty.all(Colors.white),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (value) return Colors.green.shade600;
          return Colors.grey.shade400;
        }),
        trackOutlineColor: WidgetStateProperty.resolveWith((states) {
          if (value) return Colors.green.shade600;
          return Colors.grey.shade400;
        }),
      ),
    );
  }
}
