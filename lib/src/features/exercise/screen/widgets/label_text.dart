import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class LabelTextExeProfile extends StatelessWidget {
  const LabelTextExeProfile({super.key, required this.iconData, required this.label});
  final IconData iconData;
  final String label;
  @override
  Widget build(BuildContext context) {
    var textThem =  Theme.of(context).textTheme;
    return Row(
      spacing: 24,
      children: [
      Icon(iconData, size: 36,),
      Text(label, style: textThem.bodyLarge,)
    ],);
  }
}