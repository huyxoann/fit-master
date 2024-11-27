import 'package:fit_master/src/config/logger/logger.dart';
import 'package:fit_master/src/config/routes.dart';
import 'package:fit_master/src/core/models/enum.dart';
import 'package:fit_master/src/features/plan/model/exercise.dart';
import 'package:fit_master/src/features/plan/model/workout_day.dart';
import 'package:fit_master/src/features/plan/screen/next_practice_page.dart';
import 'package:fit_master/src/features/plan/viewmodel/my_plan_viemodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';
import 'package:intl/intl.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

class PlanTodayScreen extends StatefulWidget {
  const PlanTodayScreen({super.key});

  @override
  State<PlanTodayScreen> createState() => _PlanTodayScreenState();
}

class _PlanTodayScreenState extends State<PlanTodayScreen> {
  var selectedDate = DateTime.now();
  var currentDate = DateTime.now();
  String getDayOfWeek(DateTime date) {
    DateFormat formatter = DateFormat('EEEE');
    return formatter.format(date);
  }

  // late Future<User> futureUser;

  bool isButtonDisabled = true;
  late MyPlanViewModel _viewModel;

  @override
  void initState() {
    _viewModel = Provider.of<MyPlanViewModel>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      getUserData();
    });

    super.initState();
  }

  Future<void> getUserData() async {
    final box = await Hive.openBox('userDataBox');
    final userId = box.get('userId');
    final token = box.get('token');
    _viewModel.fetchMyPlan(userId, token);
  }

  @override
  Widget build(BuildContext context) {
    var currentdayOfWeek = getDayOfWeek(currentDate);
    String dayOfWeek = getDayOfWeek(selectedDate);
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;

    return Consumer<MyPlanViewModel>(
      builder: (_, model, child) {
        logger.d("isLoading: ${model.isLoading}");
        logger.d("myPlan: ${model.myPlan}");
        List<WorkoutDay> workoutDays =
            model.myPlan?.workoutPlan.workoutDay ?? [];
        WorkoutDay? todayWorkoutDay = workoutDays.firstWhere(
            (workoutDay) =>
                workoutDay.dayOfWeek.index == selectedDate.weekday - 1,
            orElse: () => WorkoutDay(
                dayOfWeek: DayOfWeek.values[selectedDate.weekday - 1],
                exercises: [],
                workoutDayId: 1,
                workoutDayName: ''));
        if (model.isLoading) {
          return child ?? const SizedBox();
        }
        if (model.myPlan == null) {
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: Text(
                  'You don\'t have any plan',
                  style: textTheme.headlineMedium,
                ),
              ),
            ),
          );
        }
        return Scaffold(
            body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Center(
                  child: Text(
                    '${model.myPlan?.workoutPlan.planName}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.headlineMedium,
                  ),
                ),
                HorizontalWeekCalendar(
                  minDate: DateTime(2000, 12, 31),
                  maxDate: DateTime(2099, 1, 31),
                  initialDate: currentDate,
                  onDateChange: (date) {
                    setState(() {
                      selectedDate = date;
                      todayWorkoutDay = workoutDays.firstWhere(
                          (workoutDay) =>
                              workoutDay.dayOfWeek.index ==
                              selectedDate.weekday - 1,
                          orElse: () => WorkoutDay(
                                dayOfWeek:
                                    DayOfWeek.values[selectedDate.weekday - 1],
                                exercises: [],
                                workoutDayId: 1,
                                workoutDayName: '',
                              ));
                    });
                  },
                  showTopNavbar: false,
                  monthFormat: "MMMM yyyy",
                  showNavigationButtons: true,
                  weekStartFrom: WeekStartFrom.Monday,
                  borderRadius: BorderRadius.circular(12),
                  activeBackgroundColor: colorScheme.surfaceBright,
                  activeTextColor: colorScheme.onSurface,
                  inactiveBackgroundColor: colorScheme.surface.withOpacity(.3),
                  inactiveTextColor: colorScheme.onSurface,
                  disabledTextColor: colorScheme.onSurfaceVariant,
                  disabledBackgroundColor:
                      colorScheme.onSurfaceVariant.withOpacity(.3),
                  activeNavigatorColor: const Color.fromARGB(255, 84, 84, 84),
                  inactiveNavigatorColor: Colors.grey,
                  monthColor: const Color.fromARGB(255, 107, 107, 107),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      1, // Chiều cao xác định
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Today Plan',
                                style: textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return Center(
                                          child: SizedBox(
                                        width:
                                            52, // Điều chỉnh kích thước width
                                        height:
                                            52, // Điều chỉnh kích thước height
                                        child: LoadingIndicator(
                                          indicatorType: Indicator
                                              .ballScale, // Kiểu loading bạn muốn
                                          colors: [
                                            colorScheme.primaryContainer
                                          ],
                                          strokeWidth: 1.0,
                                          pathBackgroundColor:
                                              colorScheme.surface,
                                        ),
                                      ));
                                    },
                                  );

                                  await Future.delayed(
                                      const Duration(seconds: 2)); // Chờ 2 giây

                                  // Navigator.of(context).pushReplacement(
                                  //   MaterialPageRoute(builder: (context) => PlanTodayScreen(title: 'Plan Today')),
                                  // );
                                },
                                icon: const Icon(
                                  LucideIcons.refresh_cw,
                                  size: 24,
                                ),
                              )
                            ],
                          ),
                        ),
                        workoutDays.any((workoutDay) =>
                                workoutDay.dayOfWeek.index ==
                                selectedDate.weekday - 1)
                            ? Column(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                              'https://cdn.muscleandstrength.com/sites/default/files/taxonomy/image/videos/abs_0.jpg',
                                              width: 120,
                                              height: 120,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 20),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(todayWorkoutDay!.workoutDayName,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: textTheme.titleMedium),
                                          // Padding(
                                          //   padding:
                                          //       const EdgeInsetsDirectional.fromSTEB(
                                          //           0, 10, 0, 10),
                                          //   child: Text(
                                          //       'Thời gian : ${workoutDay.duration}',
                                          //       style: const TextStyle(
                                          //           color: Color.fromARGB(
                                          //               255, 255, 255, 255))),
                                          // ),
                                          const SizedBox(height: 12),
                                          ElevatedButton(
                                            onPressed: dayOfWeek ==
                                                    currentdayOfWeek
                                                ? () async {
                                                    // Hiển thị LoadingIndicator trong 2 giây rồi chuyển trang
                                                    showDialog(
                                                      context: context,
                                                      barrierDismissible: false,
                                                      builder: (BuildContext
                                                          context) {
                                                        return Center(
                                                            child: SizedBox(
                                                          width:
                                                              52, // Điều chỉnh kích thước width
                                                          height:
                                                              52, // Điều chỉnh kích thước height
                                                          child:
                                                              LoadingIndicator(
                                                            indicatorType: Indicator
                                                                .ballScale, // Kiểu loading bạn muốn
                                                            colors: [
                                                              colorScheme
                                                                  .primaryContainer
                                                            ],
                                                            strokeWidth: 1.0,
                                                            pathBackgroundColor:
                                                                colorScheme
                                                                    .surface,
                                                          ),
                                                        ));
                                                      },
                                                    );

                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              NextPracticeScreen(
                                                                workoutDay: model
                                                                    .myPlan
                                                                    ?.workoutPlan
                                                                    .workoutDay[0],
                                                              )),
                                                    );
                                                    // context.pushNamed(
                                                    //     'next_plan'
                                                    // );
                                                  }
                                                : null,
                                            style: ElevatedButton.styleFrom(
                                              foregroundColor: colorScheme
                                                  .onPrimaryContainer,
                                              backgroundColor: colorScheme
                                                  .primaryContainer, // Màu chữ trên button
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 30,
                                                      vertical: 10),
                                              textStyle: textTheme.labelLarge,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(
                                                    20), // Thiết lập radius cố định ở đây
                                              ),
                                            ),
                                            child: const Text("Start Practice"),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 16, 0, 16),
                                        child: Text(
                                          'Today Exercises',
                                          style:
                                              textTheme.titleMedium?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.4, // Giới hạn chiều cao của ListView
                                    child: ListView.builder(
                                      padding:
                                          const EdgeInsets.only(bottom: 60.0),
                                      itemCount:
                                          todayWorkoutDay?.exercises.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        Exercise? exercise =
                                            todayWorkoutDay?.exercises[index];
                                        return Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 0, 0, 8),
                                          child: Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: colorScheme.surface,
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        child: Image.network(
                                                          'https://cdn.muscleandstrength.com/sites/default/files/taxonomy/image/videos/abs_0.jpg',
                                                          width: 80,
                                                          height: 80,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 8),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            exercise?.name ??
                                                                "",
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: textTheme
                                                                .bodyLarge,
                                                          ),
                                                          Text(
                                                            "${exercise?.reps} reps",
                                                            style: textTheme
                                                                .bodySmall,
                                                          ),
                                                          Text(
                                                            "${exercise?.sets} sets",
                                                            style: textTheme
                                                                .bodySmall,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0, 0, 10, 0),
                                                        child: Container(
                                                          width: 40,
                                                          height: 40,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: colorScheme
                                                                .primaryContainer,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: IconButton(
                                                            icon: Icon(
                                                              LucideIcons.play,
                                                              color: colorScheme
                                                                  .onPrimaryContainer,
                                                              size: 24,
                                                            ),
                                                            onPressed: () {},
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              )
                            : Text(
                                "You don't have any plan today",
                                style: textTheme.bodyLarge,
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
      },
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
