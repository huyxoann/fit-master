import 'package:fit_master/src/component/primary_button.dart';
import 'package:fit_master/src/config/logger/logger.dart';
import 'package:fit_master/src/features/welcome/services/hive_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ChooseYearOrBirthPage extends StatefulWidget {
  const ChooseYearOrBirthPage({super.key});

  @override
  _ChooseYearOrBirthPageState createState() => _ChooseYearOrBirthPageState();
}

class _ChooseYearOrBirthPageState extends State<ChooseYearOrBirthPage>
    implements HiveStorage {
  final yearOfBirthController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  int yearOfBirth = 2009; // Initialize with the default year
  late FixedExtentScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = FixedExtentScrollController(
      initialItem: DateTime.now().year - 2009 - 15,
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
            Expanded(
              child: ListWheelScrollView.useDelegate(
                controller: scrollController,
                itemExtent: 50,
                physics: const FixedExtentScrollPhysics(),
                onSelectedItemChanged: (index) {
                  setState(() {
                    yearOfBirth = DateTime.now().year - index - 15;
                    yearOfBirthController.text = yearOfBirth.toString();
                  });
                },
                childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) {
                    final year = DateTime.now().year - index - 15;
                    final isSelected = year == yearOfBirth;
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: isSelected
                            ? colorScheme.primaryContainer
                            : Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          year.toString(),
                          style: textTheme.headlineSmall?.copyWith(
                            color: isSelected
                                ? colorScheme.onPrimaryContainer
                                : colorScheme.onSurface,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: 100 - 15, // Adjust the range of years as needed
                ),
              ),
            ),
            PrimaryButton(
              label: "Tiếp tục",
              onPressed: () {
                logger.d("Year of birth: $yearOfBirth");
                addToBox('yearOfBirth', yearOfBirth);
                context.pushNamed('welcome-choose-height-and-weight');
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
    logger.d(
        'Year of birth added to box: $value, year of birth type: ${value.runtimeType}');
  }
}
