// import 'package:demo_app/model/user.dart';
import 'package:fit_master/src/features/plan/model/workout_day.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:neon_circular_timer/neon_circular_timer.dart';

class NextPracticeScreen extends StatefulWidget {
  final WorkoutDay? workoutDay;
  const NextPracticeScreen({super.key, required this.workoutDay});

  @override
  State<NextPracticeScreen> createState() => _NextPracticeScreenState();
}

class _NextPracticeScreenState extends State<NextPracticeScreen> {
  int currentExerciseIndex = 0;
  void showNextExercise() {
    setState(() {
      // Kiểm tra nếu còn bài tập tiếp theo để hiển thị
      if (currentExerciseIndex <
          (widget.workoutDay?.exercises.length ?? 0) - 1) {
        currentExerciseIndex++;
      } else {
        context.pushNamed('plan_complete');
      }
    });
  }

  void showPreviousExercise() {
    setState(() {
      // Giảm chỉ số để quay lại bài tập trước đó
      if (currentExerciseIndex > 0) {
        currentExerciseIndex--;
      } else {
        context.pushNamed('plan_today');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    final currentExercise = widget.workoutDay?.exercises.isNotEmpty == true
        ? widget.workoutDay!.exercises[currentExerciseIndex]
        : null;
    final nextExercise = (widget.workoutDay?.exercises.isNotEmpty == true &&
            currentExerciseIndex < widget.workoutDay!.exercises.length - 1)
        ? widget.workoutDay!.exercises[currentExerciseIndex + 1]
        : null;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 40),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      context.pushNamed('plan_today');
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Color.fromARGB(255, 255, 255, 255),
                      size: 14,
                    ), // Icon của nút
                    label: const Text(
                      'Trở lại',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 255, 255, 255), // Màu chữ
                      ),
                    ),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Độ cong của góc nút
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Xử lý khi nhấn nút
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4), // Padding cho nút
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize
                          .min, // Đảm bảo Row không chiếm toàn bộ chiều rộng
                      children: [
                        Text(
                          'Chi tiết',
                          style: TextStyle(
                            fontSize: 14,
                            color:
                                Color.fromARGB(255, 255, 255, 255), // Màu chữ
                          ),
                        ),
                        SizedBox(width: 4), // Khoảng cách giữa Text và Icon
                        Icon(
                          Icons.contact_support_outlined,
                          color: Color.fromARGB(255, 255, 255, 255),
                          size: 14,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Center(
                    child: Column(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      'https://cdn.muscleandstrength.com/sites/default/files/taxonomy/image/videos/abs_0.jpg',
                      width: 250,
                      height: 150,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Text(
                        currentExercise!.name,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )),
                  Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                      child: Text(
                        "${currentExercise.reps} reps",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  Padding(
                      padding:
                          const EdgeInsetsDirectional.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: showPreviousExercise,
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: const Color.fromARGB(
                                  255, 236, 61, 21), // Màu chữ trên button
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              textStyle: const TextStyle(fontSize: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8), // Thiết lập radius cố định ở đây
                              ),
                            ),
                            child: const Text("Bài trước"),
                          ),
                          const SizedBox(width: 20),
                          nextExercise != null
                              ? ElevatedButton(
                                  onPressed: showNextExercise,
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: const Color.fromARGB(255,
                                        18, 129, 219), // Màu chữ trên button
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 10),
                                    textStyle: const TextStyle(fontSize: 18),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          8), // Thiết lập radius cố định ở đây
                                    ),
                                  ),
                                  child: const Text("Bài tiếp"),
                                )
                              : ElevatedButton(
                                  onPressed: showNextExercise,
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: const Color.fromARGB(255,
                                        79, 156, 47), // Màu chữ trên button
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 10),
                                    textStyle: const TextStyle(fontSize: 18),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          8), // Thiết lập radius cố định ở đây
                                    ),
                                  ),
                                  child: const Text("Hoàn thành"),
                                )
                        ],
                      )),
                ])),
              ],
            ),
            const Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                  child: Text(
                    'Bài tập kế tiếp',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            nextExercise != null
                ? Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 10),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: const Color.fromARGB(255, 104, 106, 107),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    'https://cdn.muscleandstrength.com/sites/default/files/taxonomy/image/videos/abs_0.jpg',
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    nextExercise.name,
                                    style: textTheme.bodyMedium,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 0),
                                    child: Text(
                                      "${nextExercise.reps} reps",
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Container(
                            //   width: 40,
                            //   height: 40,
                            //   decoration: BoxDecoration(
                            //     color: const Color.fromARGB(255, 18, 129, 219),
                            //     borderRadius: BorderRadius.circular(8),
                            //   ),
                            //   child: IconButton(
                            //     icon: const Icon(
                            //       Icons.arrow_right_sharp,
                            //       color: Color.fromARGB(255, 255, 255, 255),
                            //       size: 24,
                            //     ),
                            //     onPressed: () {},
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  )
                : const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: Text(
                      "Đã hoàn thành các bài tập hôm nay",
                      style: TextStyle(
                          color: Color.fromARGB(255, 21, 133, 193),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
