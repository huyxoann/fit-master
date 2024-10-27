import 'package:fit_master/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';
import 'package:intl/intl.dart';

class PlanTodayScreen extends StatefulWidget {
  const PlanTodayScreen({super.key, required this.title});

  final String title;

  @override
  State<PlanTodayScreen> createState() => _PlanTodayScreenState();
}

class _PlanTodayScreenState extends State<PlanTodayScreen> {
  var selectedDate = DateTime.now();

  String getDayOfWeek(DateTime date) {
    DateFormat formatter =
        DateFormat('EEEE'); // Định dạng để lấy thứ bằng tiếng Việt
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    String dayOfWeek = getDayOfWeek(selectedDate);
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            HorizontalWeekCalendar(
              minDate: DateTime(2000, 12, 31),
              maxDate: DateTime(2099, 1, 31),
              initialDate: selectedDate,
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
              activeBackgroundColor: const Color.fromARGB(255, 99, 98, 100),
              activeTextColor: Colors.white,
              inactiveBackgroundColor:
                  const Color.fromARGB(255, 93, 93, 93).withOpacity(.3),
              inactiveTextColor: Colors.white,
              disabledTextColor: Colors.grey,
              disabledBackgroundColor: Colors.grey.withOpacity(.3),
              activeNavigatorColor: const Color.fromARGB(255, 84, 84, 84),
              inactiveNavigatorColor: Colors.grey,
              monthColor: const Color.fromARGB(255, 107, 107, 107),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                          child: Text(
                            'Lịch tập ${DateFormat('dd MMM yyyy').format(selectedDate)}',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
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
                                width: 150,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Bài Tập Tay',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                              const Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 10),
                                child: Text('Thời gian : 4 giờ',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 255, 255, 255))),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Thao tác khi button được nhấn
                                  print("hello world!");
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: const Color.fromARGB(
                                      255, 18, 129, 219), // Màu chữ trên button
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 10),
                                  textStyle: const TextStyle(fontSize: 20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        8), // Thiết lập radius cố định ở đây
                                  ),
                                ),
                                child: const Text("Bắt đầu"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0, 10, 0, 10),
                          child: Text('Today : $dayOfWeek',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255))),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
