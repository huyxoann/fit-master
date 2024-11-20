import 'package:flutter/material.dart';

class NumbersWidget extends StatelessWidget {

  final String weight;
  final String height;


  const NumbersWidget({
    super.key,
    required this.weight,
    required this.height,
  });

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildButton(context, "$weight kg", 'Weight'),
          buildDivider(),
          buildButton(context, "$height m", 'Height'),
        ],
      );
  Widget buildDivider() => SizedBox(
        height: 24,
        child: const VerticalDivider(),
      );

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 2),
            Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
}
