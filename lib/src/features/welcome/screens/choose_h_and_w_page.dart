import 'package:fit_master/src/component/primary_button.dart';
import 'package:fit_master/config/logger/logger.dart';
import 'package:fit_master/src/features/welcome/services/hive_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ChooseHAndWPage extends StatefulWidget {
  const ChooseHAndWPage({super.key});

  @override
  _ChooseHAndWPageState createState() => _ChooseHAndWPageState();
}

class _ChooseHAndWPageState extends State<ChooseHAndWPage>
    implements HiveStorage {
  final formKey = GlobalKey<FormState>();
  late FixedExtentScrollController scrollController;
  late FixedExtentScrollController heightScrollController;
  double selectedHeight = 170.0; // Default height
  double selectedWeight = 50; // Default height

  @override
  void initState() {
    super.initState();
    scrollController = FixedExtentScrollController(
      initialItem: ((selectedWeight - 35) * 10).toInt(),
    );
    heightScrollController = FixedExtentScrollController(
      initialItem: ((selectedHeight - 100) * 2).toInt(),
    );
  }

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
        title: Text("Chiều cao và cân nặng của bạn?",
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
            Column(
              children: [
                Text(
                  "Chiều cao của bạn (cm):",
                  style: textTheme.bodyLarge,
                ),
                SizedBox(
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListWheelScrollView.useDelegate(
                          controller: heightScrollController,
                          itemExtent: 50,
                          physics: const FixedExtentScrollPhysics(),
                          onSelectedItemChanged: (index) {
                            setState(() {
                              selectedHeight = 100 + index * 0.5;
                            });
                          },
                          childDelegate: ListWheelChildBuilderDelegate(
                            builder: (context, index) {
                              final heightValue =
                                  (100 + index * 0.5).toStringAsFixed(1);
                              final isSelected =
                                  selectedHeight == 100 + index * 0.5;
                              return Center(
                                child: Text(
                                  heightValue,
                                  style: textTheme.headlineMedium?.copyWith(
                                    color: isSelected
                                        ? colorScheme.primary
                                        : colorScheme.onSurface,
                                    fontWeight: isSelected
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                              );
                            },
                            childCount:
                                260, // 100.0 to 230.0 with 0.5 increments
                          ),
                        ),
                      ),
                      Text(
                        "cm",
                        style: textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
                Text(
                  "Cân nặng của bạn (kg):",
                  style: textTheme.bodyLarge,
                ),
                SizedBox(
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListWheelScrollView.useDelegate(
                          controller: FixedExtentScrollController(
                            initialItem:
                                ((70 - 35) * 1).toInt(), // Default weight 70kg
                          ),
                          itemExtent: 50,
                          physics: const FixedExtentScrollPhysics(),
                          onSelectedItemChanged: (index) {
                            setState(() {
                              selectedWeight = 35 + index * 1.0;
                            });
                          },
                          childDelegate: ListWheelChildBuilderDelegate(
                            builder: (context, index) {
                              final weightValue =
                                  (35 + index * 1.0).toStringAsFixed(1);
                              final isSelected =
                                  selectedWeight == 35 + index * 1.0;
                              return Center(
                                child: Text(
                                  weightValue,
                                  style: textTheme.headlineMedium?.copyWith(
                                    color: isSelected
                                        ? colorScheme.primary
                                        : colorScheme.onSurface,
                                    fontWeight: isSelected
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                              );
                            },
                            childCount: 86, // 35.0 to 120.0 with 1.0 increments
                          ),
                        ),
                      ),
                      Text(
                        "kg",
                        style: textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            PrimaryButton(
              label: "Tiếp tục",
              onPressed: () {
                // Handle continue button press
                logger.d(
                    "Height & Width: $selectedHeight cm, $selectedWeight kg");
                addToBox('height', selectedHeight);
                addToBox('weight', selectedWeight);
                context.pushNamed('welcome-gym-location');
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Future<void> addToBox(tag, value) async {
    var box = Hive.box('userDataBox');
    box.put(tag, value);
    logger.d('Insert value: $value of tag: $tag');
  }
}
