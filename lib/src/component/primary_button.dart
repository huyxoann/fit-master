import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? prefixIcon;

  const PrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        disabledForegroundColor: colorScheme.onSurfaceVariant,
        backgroundColor: colorScheme.primaryContainer,
        minimumSize:
            const Size(double.infinity, 40), // Set the width to maximum
      ),
      child: Row(
        mainAxisAlignment: prefixIcon != null
            ? MainAxisAlignment.start
            : MainAxisAlignment.center,
        children: [
          prefixIcon != null
              ? Icon(
                  prefixIcon,
                  size: 24,
                  color: colorScheme.onPrimaryContainer,
                )
              : Container(),
          const SizedBox(width: 12),
          Text(
            label,
            style: textTheme.bodyLarge?.copyWith(
              color: colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
