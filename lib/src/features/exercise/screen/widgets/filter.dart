import 'package:flutter/material.dart';

class ExperienceFilterWidget extends StatefulWidget {
  final String label;
  final List<String> options;
  final ValueChanged<String>? onSelected;

  const ExperienceFilterWidget({
    Key? key,
    required this.options,
    this.onSelected,
    required this.label,
  }) : super(key: key);

  @override
  _ExperienceFilterWidgetState createState() => _ExperienceFilterWidgetState();
}

class _ExperienceFilterWidgetState extends State<ExperienceFilterWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var colorTheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: textTheme.labelLarge
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 32, // Chiều cao cố định cho ListView
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.options.length,
            itemBuilder: (context, index) {
              bool isSelected = selectedIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                  if (widget.onSelected != null) {
                    widget.onSelected!(widget.options[index]);
                  }
                },
                child: AnimatedContainer(
                  margin: const EdgeInsets.only(right: 24),
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected
                      ? colorTheme.surfaceContainerHighest // surface-container-highest
                      : colorTheme.surfaceContainerLow, // surface-container-low
                  borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text(
                    widget.options[index],
                    style: textTheme.labelMedium?.copyWith(
                      color: colorTheme.onSurface,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
