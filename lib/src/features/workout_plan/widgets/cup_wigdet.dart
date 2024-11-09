import 'package:fit_master/src/core/models/trophy_state_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class CupWidget extends StatelessWidget {
  final int day;
  final TrophyStateEnum state;

  const CupWidget({super.key, required this.day, required this.state});

  Color _setColorByState(TrophyStateEnum state, ColorScheme colorScheme) {
    switch (state) {
      case TrophyStateEnum.completed:
        return colorScheme.primary;
      case TrophyStateEnum.notCompleted:
        return colorScheme.surfaceContainerHighest;
      case TrophyStateEnum.today:
        return colorScheme.onSurface;
    }
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    double iconSize = MediaQuery.of(context).size.width * 0.08;
    double padding = MediaQuery.of(context).size.width * 0.02;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: state == TrophyStateEnum.today
                ? colorScheme.surfaceBright
                : Colors.transparent,
          ),
          child: Icon(
            LucideIcons.trophy,
            size: iconSize,
            color: _setColorByState(state, colorScheme),
          ),
        ),
        Text('$day', style: TextStyle(fontSize: iconSize * 0.5)),
      ],
    );
  }
}
