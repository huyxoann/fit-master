import 'package:flutter/material.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';
import 'package:intl/intl.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'start_practice_page.dart';

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
          child: ListView(
            children: <Widget>[
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
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 15),
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
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Bài Tập Tay',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
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
                                  onPressed: () async {
                                    // Hiển thị LoadingIndicator trong 2 giây rồi chuyển trang
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
                                            pathBackgroundColor: Colors.black45,
                                          ),
                                        ));
                                      },
                                    );

                                    await Future.delayed(const Duration(
                                        seconds: 2)); // Chờ 2 giây

                                    // Ẩn loading indicator và chuyển đến Page2
                                    Navigator.pop(
                                        // ignore: use_build_context_synchronously
                                        context); // Đóng dialog loading
                                    Navigator.push(
                                      // ignore: use_build_context_synchronously
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const StartPracticeScreen(
                                                title: 'Start Practice',
                                              )),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: const Color.fromARGB(255,
                                        18, 129, 219), // Màu chữ trên button
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
                        mainAxisAlignment: MainAxisAlignment.center,
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
                      const Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                            child: Text(
                              'Các bài tập của hôm nay',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      // ListView chiếm nửa dưới màn hình
                      SizedBox(
                        height: MediaQuery.of(context).size.height *
                            0.5, // Giới hạn chiều cao của ListView
                        child: ListView.builder(
                          padding: const EdgeInsets.only(bottom: 60.0),
                          itemCount: 5, // Số lần lặp lại Card
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 10),
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
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Plank swap',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 0),
                                              child: Text(
                                                '10 rep',
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
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 0, 10, 0),
                                            child: Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 18, 129, 219),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: IconButton(
                                                icon: const Icon(
                                                  Icons.arrow_right_sharp,
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  size: 24,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: colorScheme.onSurface,
        selectedItemColor: colorScheme.onPrimaryContainer,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(LucideIcons.house),
            ),
            label: 'Trang chủ',
            backgroundColor: colorScheme.surfaceBright,
          ),
          const BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(LucideIcons.biceps_flexed),
            ),
            label: 'Bài tập',
          ),
          const BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(LucideIcons.calendar),
            ),
            label: 'Lộ trình',
          ),
          const BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(LucideIcons.settings),
            ),
            label: 'Cài đặt',
          ),
        ],
      ),
    );
  }
}
