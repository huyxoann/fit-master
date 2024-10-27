import 'package:fit_master/src/component/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class WelcomePage6 extends StatefulWidget {
  const WelcomePage6({super.key});

  @override
  _WelcomePage6State createState() => _WelcomePage6State();
}

class _WelcomePage6State extends State<WelcomePage6> {
  @override
  Widget build(BuildContext context) {
    int selectedCardIndex = -1;
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
        title: Text("Năm sinh của bạn?",
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            const Expanded(
                child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Năm sinh",
              ),
            )),
            Column(
              children: [
                PrimaryButton(
                    label: "Tiếp tục",
                    onPressed: selectedCardIndex != -1
                        ? () =>
                            context.pushNamed('welcome-choose-year-of-birth')
                        : null),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
