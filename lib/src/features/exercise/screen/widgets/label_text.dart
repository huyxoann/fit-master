import 'package:flutter/material.dart';

class LabelTextExeProfile extends StatelessWidget {
  const LabelTextExeProfile(
      {super.key, required this.iconData, required this.label});
  final IconData iconData;
  final String label;
  @override
  Widget build(BuildContext context) {
    var textThem = Theme.of(context).textTheme;
    return Row(
      children: [
        Icon(
          iconData,
          size: 36,
        ),
        Text(
          label,
          style: textThem.bodyLarge,
        )
      ],
    );
  }
}
