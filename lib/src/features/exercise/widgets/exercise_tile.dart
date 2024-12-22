import 'package:fit_master/src/commom_widgets/header_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class ExerciseTile extends StatelessWidget {
  final String name;
  final String coverImage;
  const ExerciseTile({
    super.key,
    required this.name,
    required this.coverImage,
  });

  @override
  Widget build(BuildContext context) {
    // var widthScreen = AppInfo.getScreenWidth(context);
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4), // Apply border radius
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: FadeInImage.assetNetwork(
                    placeholder:
                        'assets/images/placeholder.png', // placeholder image
                    image: coverImage,
                    fit: BoxFit.cover,
                    fadeInDuration: const Duration(milliseconds: 300),
                    fadeOutDuration: const Duration(milliseconds: 300),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(name),
            ],
          ),
          const Icon(LucideIcons.chevron_right)
        ],
      ),
    );
  }
}
