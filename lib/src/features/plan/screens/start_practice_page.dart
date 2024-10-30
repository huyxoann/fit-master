import 'package:fit_master/src/features/plan/screens/complete_plan_page.dart';
import 'package:flutter/material.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

class StartPracticeScreen extends StatefulWidget {
  const StartPracticeScreen({super.key, required this.title});

  final String title;

  @override
  State<StartPracticeScreen> createState() => _PlanTodayScreenState();
}

class _PlanTodayScreenState extends State<StartPracticeScreen> {
  @override
  Widget build(BuildContext context) {
    final CountDownController controller = CountDownController();
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
                      Navigator.pop(context);
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
            NeonCircularTimer(
                onComplete: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CompletePlanScreen(
                              title: 'Complete Plan',
                            )),
                  );
                },
                width: 200,
                controller: controller,
                duration: 20,
                strokeWidth: 10,
                isTimerTextShown: true,
                neumorphicEffect: true,
                outerStrokeColor: Colors.grey.shade100,
                innerFillGradient: LinearGradient(colors: [
                  Colors.greenAccent.shade200,
                  Colors.blueAccent.shade400
                ]),
                neonGradient: LinearGradient(colors: [
                  Colors.greenAccent.shade200,
                  Colors.blueAccent.shade400
                ]),
                strokeCap: StrokeCap.round,
                innerFillColor: const Color.fromARGB(31, 255, 255, 255),
                backgroundColor: const Color.fromARGB(255, 56, 56, 57),
                neonColor: Colors.blue.shade900),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        icon: const Icon(Icons.play_arrow),
                        onPressed: () {
                          controller.resume();
                        }),
                    IconButton(
                        icon: const Icon(Icons.pause),
                        onPressed: () {
                          controller.pause();
                        }),
                    IconButton(
                        icon: const Icon(Icons.repeat),
                        onPressed: () {
                          controller.restart();
                        }),
                  ]),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 10),
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
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Plank swap',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              child: Text(
                                '10 rep',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 10, 0),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 18, 129, 219),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.arrow_right_sharp,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  size: 24,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
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
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 10),
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
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Plank swap',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              child: Text(
                                '10 rep',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 10, 0),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 18, 129, 219),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.arrow_right_sharp,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  size: 24,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
