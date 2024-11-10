import 'package:fit_master/src/component/primary_button.dart';
import 'package:fit_master/src/config/logger/logger.dart';
import 'package:fit_master/src/core/models/enum.dart';
import 'package:fit_master/src/features/welcome/services/hive_storage.dart';
import 'package:fit_master/src/features/welcome/widgets/gym_location_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class TrainingLocationPage extends StatefulWidget {
  const TrainingLocationPage({super.key});

  @override
  _TrainingLocationPageState createState() => _TrainingLocationPageState();
}

class _TrainingLocationPageState extends State<TrainingLocationPage>
    implements HiveStorage {
  GymLocation _gymLocation = GymLocation.gym;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    int gymLocationSelected = -1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.chevron_left),
          color: colorScheme.onSurface,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Bạn muốn tập luyện ở đâu?",
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
                    "Chọn địa điểm tập luyện ưa thích của bạn để chúng tôi có thể thiết kế lộ trình phù hợp.",
                    style: textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                ),
                itemCount: GymLocation.values.length,
                itemBuilder: (context, index) {
                  GymLocation gymLocation = GymLocation.values[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        gymLocationSelected = gymLocation.index;
                        _gymLocation = gymLocation;
                      });
                    },
                    child: Card(
                      color: gymLocationSelected == index
                          ? colorScheme.primaryContainer
                          : colorScheme.surfaceBright,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: gymLocationSelected == index
                              ? colorScheme.outline
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: GymLocationCard(
                        gymLocation: gymLocation,
                      ),
                    ),
                  );
                },
              ),
            ),
            PrimaryButton(
              label: "Tiếp tục",
              onPressed: () {
                // Handle continue button press
                logger.d("Selected Location: $_gymLocation");
                addToBox('location', _gymLocation.index);
                context.pushNamed(
                    'welcome-create-profile'); // Replace with your next page route
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Future<void> addToBox(String tag, value) async {
    var box = Hive.box('userDataBox');
    box.put(tag, value);
    logger.d(
        'Gym location added to box: $value, Gym location type: ${value.runtimeType}');
  }
}
