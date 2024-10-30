import 'package:fit_master/config/logger/logger.dart';
import 'package:fit_master/src/component/primary_button.dart';
import 'package:fit_master/src/core/models/enum.dart';
import 'package:fit_master/src/features/welcome/widgets/fitness_goal_card_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class WelcomePage5 extends StatefulWidget {
  const WelcomePage5({super.key});

  @override
  _WelcomePage5State createState() => _WelcomePage5State();
}

class _WelcomePage5State extends State<WelcomePage5> {
  FitnessGoal _fitnessGoal = FitnessGoal.bodyWeight;
  int selectedCardIndex = -1;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.chevron_left),
          color: colorScheme.onSurface,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Mục tiêu luyện tập",
            style: textTheme.headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold)),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: StepProgressIndicator(
              totalSteps: 5,
              roundedEdges: Radius.circular(12),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: colorScheme.surfaceBright,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "“Giúp chúng tôi thiết kế lộ trình khớp với tỉ lệ trao chất của cơ thể.",
                    style: textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: FitnessGoal.values.length,
                itemBuilder: (context, index) {
                  FitnessGoal fitnessGoal = FitnessGoal.values[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCardIndex = index;
                        _fitnessGoal = fitnessGoal;
                      });
                    },
                    child: Card(
                      color: selectedCardIndex == index
                          ? colorScheme.primaryContainer
                          : colorScheme.surfaceBright,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: selectedCardIndex == index
                              ? colorScheme.outline
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: FitnessGoalCardTile(
                        title: fitnessGoal.name,
                        fitnessGoal: fitnessGoal,
                      ),
                    ),
                  );
                },
              ),
            ),
            Column(
              children: [
                PrimaryButton(
                    label: "Tiếp tục",
                    onPressed: selectedCardIndex != -1
                        ? () {
                            logger.d("Fitness goal: $_fitnessGoal");
                            context.pushNamed('welcome-choose-year-of-birth');
                          }
                        : null),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
