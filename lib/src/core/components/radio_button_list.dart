import 'package:assign_in/src/core/components/general_container.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class RadioButtonsWithTitle<T> extends StatefulWidget {
  const RadioButtonsWithTitle({
    super.key,
    required this.options,
    required this.onChanged,
    required this.getTitle,
    this.child,
    this.icon,
  });

  final List<T> options;
  final Function(T) onChanged;
  final String Function(T) getTitle;
  final Widget? child;
  final IconData? icon;

  @override
  State<RadioButtonsWithTitle<T>> createState() =>
      _RadioButtonsWithTitleState<T>();
}

class _RadioButtonsWithTitleState<T> extends State<RadioButtonsWithTitle<T>> {
  List<T> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    List<Row> buildRows(List<T> options, int itemsPerRow) {
      final List<Row> rows = [];
      for (int i = 0; i < options.length; i += itemsPerRow) {
        rows.add(
          Row(
            children: List.generate(itemsPerRow, (j) {
              if (i + j >= options.length) return const SizedBox();
              final T option = options[i + j];
              final isSelected = selectedOptions.contains(option);
              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      selectedOptions.remove(option);
                    } else {
                      selectedOptions.add(option);
                    }
                  });
                  widget.onChanged(option);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 4,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF16c963)
                              : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xFF16c963)
                                : Colors.grey.shade600,
                            width: 1.5,
                          ),
                        ),
                        child: isSelected
                            ? const Center(
                                child: Icon(
                                  Icons.check,
                                  size: 12,
                                  color: Colors.white,
                                ),
                              )
                            : null,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        widget.getTitle(option),
                        style: context.textTheme.bodySmall?.copyWith(
                          fontSize: 12.5,
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                ),
              );
            }),
          ),
        );
      }
      return rows;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GeneralContainer(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
          child: Column(children: buildRows(widget.options, 3)),
        ),
      ],
    );
  }
}
