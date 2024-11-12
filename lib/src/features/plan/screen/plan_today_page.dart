import 'package:fit_master/src/features/plan/model/exercise.dart';
import 'package:fit_master/src/features/plan/model/user.dart';
import 'package:fit_master/src/features/plan/model/workout_day.dart';
import 'package:fit_master/src/features/plan/model/workout_plan.dart';
import 'package:fit_master/src/features/plan/screen/next_practice_page.dart';
import 'package:fit_master/src/features/plan/services/workout_service.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';
import 'package:intl/intl.dart';
import 'package:loading_indicator/loading_indicator.dart';

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

  late Future<User> futureUser;

  bool isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    futureUser = WorkoutService().fetchUserData(); // Gọi API để lấy dữ liệu
  }

  @override
  Widget build(BuildContext context) {
    var currentdayOfWeek = getDayOfWeek(currentDate);
    String dayOfWeek = getDayOfWeek(selectedDate);

    return Scaffold(
      body: FutureBuilder<User>(
        future: futureUser,
        builder: (context, snapshot) {
          // Kiểm tra trạng thái của Future
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Hiển thị spinner khi đang chờ dữ liệu
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // Hiển thị thông báo lỗi nếu có lỗi
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            User user = snapshot.data!;
            WorkoutPlan workoutPlan = user.workoutPlan[0];
            List<WorkoutDay> listWorkoutDay = workoutPlan.workoutDay;

            WorkoutDay? workoutDay;

            for (int index = 0; index < listWorkoutDay.length; index++) {
              if (listWorkoutDay[index].workoutDayName == dayOfWeek) {
                workoutDay =
                    listWorkoutDay[index]; // Assign the matching workoutDay
                break; // Exit the loop once the matching workoutDay is found
              }
            }
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListView(
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Plan : ${workoutPlan.planName}',
                        style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    HorizontalWeekCalendar(
                      minDate: DateTime(2000, 12, 31),
                      maxDate: DateTime(2099, 1, 31),
                      initialDate: currentDate,
                      onDateChange: (date) {
                        setState(() {
                          selectedDate = date;
                        });
                      },
                      showTopNavbar: false,
                      monthFormat: "MMMM yyyy",
                      showNavigationButtons: true,
                      weekStartFrom: WeekStartFrom.Monday,
                      borderRadius: BorderRadius.circular(7),
                      activeBackgroundColor:
                          const Color.fromARGB(255, 99, 98, 100),
                      activeTextColor: Colors.white,
                      inactiveBackgroundColor:
                          const Color.fromARGB(255, 93, 93, 93).withOpacity(.3),
                      inactiveTextColor: Colors.white,
                      disabledTextColor: Colors.grey,
                      disabledBackgroundColor: Colors.grey.withOpacity(.3),
                      activeNavigatorColor:
                          const Color.fromARGB(255, 84, 84, 84),
                      inactiveNavigatorColor: Colors.grey,
                      monthColor: const Color.fromARGB(255, 107, 107, 107),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height *
                          1, // Chiều cao xác định
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 15),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Lịch tập ${DateFormat('dd MMM yyyy').format(selectedDate)}',
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return const Center(
                                              child: SizedBox(
                                            width:
                                                50, // Điều chỉnh kích thước width
                                            height:
                                                50, // Điều chỉnh kích thước height
                                            child: LoadingIndicator(
                                              indicatorType: Indicator
                                                  .ballScale, // Kiểu loading bạn muốn
                                              colors: [Colors.blue],
                                              strokeWidth: 1.0,
                                              pathBackgroundColor:
                                                  Colors.black45,
                                            ),
                                          ));
                                        },
                                      );

                                      await Future.delayed(const Duration(
                                          seconds: 2)); // Chờ 2 giây

                                      // Navigator.of(context).pushReplacement(
                                      //   MaterialPageRoute(builder: (context) => PlanTodayScreen(title: 'Plan Today')),
                                      // );
                                    },
                                    icon: Icon(
                                      Icons
                                          .refresh, // Replace with your desired icon
                                      color: Colors
                                          .blue, // Customize the icon color
                                      size: 24, // Customize the icon size
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        'https://cdn.muscleandstrength.com/sites/default/files/taxonomy/image/videos/abs_0.jpg',
                                        width: 120,
                                        height: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(workoutDay!.typeWorkout,
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 10),
                                        child: Text(
                                            'Thời gian : ${workoutDay.duration}',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255))),
                                      ),
                                      dayOfWeek == currentdayOfWeek
                                          ? ElevatedButton(
                                              onPressed: () async {
                                                // Hiển thị LoadingIndicator trong 2 giây rồi chuyển trang
                                                showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder:
                                                      (BuildContext context) {
                                                    return const Center(
                                                        child: SizedBox(
                                                      width:
                                                          50, // Điều chỉnh kích thước width
                                                      height:
                                                          50, // Điều chỉnh kích thước height
                                                      child: LoadingIndicator(
                                                        indicatorType: Indicator
                                                            .ballScale, // Kiểu loading bạn muốn
                                                        colors: [Colors.blue],
                                                        strokeWidth: 1.0,
                                                        pathBackgroundColor:
                                                            Colors.black45,
                                                      ),
                                                    ));
                                                  },
                                                );

                                                await Future.delayed(
                                                    const Duration(
                                                        seconds:
                                                            2)); // Chờ 2 giây

                                                // Ẩn loading indicator và chuyển đến Page2
                                                Navigator.pop(
                                                    // ignore: use_build_context_synchronously
                                                    context); // Đóng dialog loading
                                                Navigator.push(
                                                  // ignore: use_build_context_synchronously
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          NextPracticeScreen(
                                                            workoutDay:
                                                                workoutDay,
                                                          )),
                                                );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                foregroundColor: Colors.white,
                                                backgroundColor: const Color
                                                    .fromARGB(255, 18, 129,
                                                    219), // Màu chữ trên button
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 30,
                                                        vertical: 10),
                                                textStyle: const TextStyle(
                                                    fontSize: 20),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8), // Thiết lập radius cố định ở đây
                                                ),
                                              ),
                                              child:
                                                  const Text("Start Practice"),
                                            )
                                          : ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                foregroundColor: Colors.white,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 30,
                                                        vertical: 10),
                                                textStyle: const TextStyle(
                                                    fontSize: 20),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8), // Thiết lập radius cố định ở đây
                                                ),
                                              ),
                                              onPressed: isButtonDisabled
                                                  ? null // Disable the button when this is true
                                                  : () {},
                                              child: const Text("Coming soon"),
                                            ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 15, 0, 15),
                                  child: Text(
                                    'Các bài tập của hôm nay',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            // ListView chiếm nửa dưới màn hình
                            SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  0.4, // Giới hạn chiều cao của ListView
                              child: ListView.builder(
                                padding: const EdgeInsets.only(bottom: 60.0),
                                itemCount: workoutDay.exercises.length,
                                itemBuilder: (BuildContext context, int index) {
                                  Exercise? exercise =
                                      workoutDay?.exercises[index];
                                  return Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 10),
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: const Color.fromARGB(
                                          255, 104, 106, 107),
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
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
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    exercise!.name,
                                                    style: const TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 255, 255, 255),
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 0),
                                                    child: Text(
                                                      "${exercise.reps} reps",
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 255, 255, 255),
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
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0, 0, 10, 0),
                                                  child: Container(
                                                    width: 40,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              18,
                                                              129,
                                                              219),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: IconButton(
                                                      icon: const Icon(
                                                        Icons.arrow_right_sharp,
                                                        color: Color.fromARGB(
                                                            255, 255, 255, 255),
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
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            // Nếu không có dữ liệu (trường hợp này hiếm xảy ra)
            return Text('No user data available');
          }
        },
      ),
    );
  }
}
