import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:assign_in/src/core/features/overview/model/project_model.dart';
import 'package:assign_in/src/utils/time_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecentProjectCard extends StatefulWidget {
  const RecentProjectCard({super.key, required this.projectModel});

  final ProjectModel projectModel;

  @override
  State<RecentProjectCard> createState() => _RecentProjectCardState();
}

class _RecentProjectCardState extends State<RecentProjectCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: myPadding / 2),
      padding: const EdgeInsets.all(myPadding / 1.7),
      width: context.width / 2.1,
      decoration: BoxDecoration(
        color: widget.projectModel.color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(myPadding),
          bottomLeft: Radius.circular(myPadding),
          bottomRight: Radius.circular(myPadding),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _topSection(),
          const SizedBox(height: myPadding / 1.5),

          Text(
            widget.projectModel.title,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: myPadding / 2.5),
          Text(
            widget.projectModel.decription,
            style: context.textTheme.bodySmall?.copyWith(
              color: Colors.grey.shade700,
              fontSize: 10,
            ),
          ),
          const SizedBox(height: myPadding / 2),

          StackedImages(
            imageUrls: widget.projectModel.images,
            size: 30,
            overlap: 10,
          ),
          const SizedBox(height: myPadding / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShowTime(
                icon: Icons.message,
                text: ' ${widget.projectModel.comments} comments',
              ),
              ShowTime(
                icon: Icons.access_time,
                text: TimeUtils.convertDateFormat(widget.projectModel.date),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _topSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BadgeContainer(
          child: Text(
            widget.projectModel.category,
            style: context.textTheme.bodyMedium?.copyWith(fontSize: 12),
          ),
        ),
        SvgPicture.asset(
          'assets/svg/arrow_up.svg',
          height: 28,
          width: 28,
          fit: BoxFit.cover,
          colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
        ),
      ],
    );
  }
}

class BadgeContainer extends StatelessWidget {
  const BadgeContainer({super.key, required this.child, this.color});
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: myPadding / 1.5,
        vertical: myPadding / 3,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(myPadding * 3),
        color: color ?? Colors.white,
      ),
      child: child,
    );
  }
}

class StackedImages extends StatelessWidget {
  const StackedImages({
    super.key,
    required this.imageUrls,
    this.size = 36,
    this.overlap = 12,
    this.borderColor = Colors.white,
    this.borderWidth = 1,
  });

  final List<String> imageUrls;
  final double size;
  final double overlap;
  final Color borderColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    final urls = imageUrls.take(4).toList();
    final count = urls.length;

    if (count == 0) {
      return SizedBox(width: size, height: size);
    }

    final totalWidth = size + (count - 1) * (size - overlap);

    return SizedBox(
      width: totalWidth,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: List.generate(count, (i) {
          final left = i * (size - overlap);
          return Positioned(
            left: left,
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: borderColor, width: borderWidth),
              ),
              child: ClipOval(child: _buildAvatar(urls[i], size)),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildAvatar(String url, double diameter) {
    if (url.trim().isEmpty) {
      return Container(
        alignment: Alignment.center,
        color: Colors.grey.shade300,
        child: Icon(Icons.person, size: diameter * 0.5),
      );
    }

    return Image.network(
      url,
      width: diameter,
      height: diameter,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => Container(
        color: Colors.grey.shade300,
        alignment: Alignment.center,
        child: Icon(Icons.person, size: diameter * 0.5),
      ),
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          color: Colors.grey.shade200,
          alignment: Alignment.center,
          child: SizedBox(
            width: diameter * 0.4,
            height: diameter * 0.4,
            child: const CircularProgressIndicator(strokeWidth: 1),
          ),
        );
      },
    );
  }
}

class ShowTime extends StatelessWidget {
  const ShowTime({
    super.key,
    required this.text,
    this.icon,
    this.iconColor,
    this.textColor,
    this.fontSize,
    this.size,
    this.image,
  });
  final String text;
  final IconData? icon;
  final Color? iconColor;
  final Color? textColor;
  final double? fontSize;
  final double? size;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _iconData(),
        const SizedBox(width: 2),
        Text(
          text,
          style: context.textTheme.bodySmall?.copyWith(
            color: textColor ?? MyColors.textColor,
            fontSize: fontSize ?? 8,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _iconData() {
    if (image != null) {
      return SvgPicture.asset(
        image!,
        height: 16,
        width: 16,
        colorFilter: ColorFilter.mode(MyColors.textColor, BlendMode.srcIn),
      );
    } else if (icon != null) {
      return Icon(
        icon,
        color: iconColor ?? Colors.grey.shade500,
        size: size ?? 12,
      );
    }
    return const SizedBox.shrink();
  }
}
