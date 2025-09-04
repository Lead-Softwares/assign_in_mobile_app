import 'package:assign_in/src/core/components/bottom_navbar.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIconWidget extends StatelessWidget {
  final NavItem item;
  final bool isSelected;
  final double size;

  const AppIconWidget({
    super.key,
    required this.item,
    required this.isSelected,
    this.size = 26,
  });

  @override
  Widget build(BuildContext context) {
    final gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.blue, MyColors.gradient2, MyColors.gradientColor1],
    );

    if (item.activeSvg != null || item.inactiveSvg != null) {
      final svgPath = isSelected
          ? item.activeSvg!
          : item.inactiveSvg ?? item.activeSvg!;
      final svg = SvgPicture.asset(svgPath, height: size, width: size);

      return isSelected
          ? svg
          : ColorFiltered(
              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              child: svg,
            );
    }

    if (item.icon != null) {
      final baseIcon = Icon(item.icon, size: size);
      return isSelected
          ? ShaderMask(
              shaderCallback: (bounds) => gradient.createShader(bounds),
              blendMode: BlendMode.srcIn,
              child: baseIcon,
            )
          : Icon(item.icon, size: size, color: Colors.grey);
    }

    return const SizedBox();
  }
}
