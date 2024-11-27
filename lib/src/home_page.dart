// import 'package:fit_master/src/features/exercise/screen/list_exercise.dart';
// import 'package:fit_master/src/features/gymlocation/screen/GymLocation.dart';
// import 'package:fit_master/src/features/plan/screen/plan_today_page.dart';
// import 'package:fit_master/src/features/workout_plan/screens/dashboard_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_lucide/flutter_lucide.dart';
// import 'package:go_router/go_router.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _selectedIndex = 0;
//   final PageStorageBucket bucket = PageStorageBucket();
//   final List<Widget> _pages = <Widget>[
//     const WorkoutDashBoard(),
//     const ListExerciseScreen(),
//     const PlanTodayScreen(),
//     const GymListScreen()
//   ];
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   final List<GlobalKey<NavigatorState>> _navigatorKeys = [
//     GlobalKey<NavigatorState>(),
//     GlobalKey<NavigatorState>(),
//     GlobalKey<NavigatorState>(),
//     GlobalKey<NavigatorState>(),
//     GlobalKey<NavigatorState>(),
//   ];

//   void _onItemTapped(int index) {
//     if (_selectedIndex == index) {
//       _navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);
//     } else {
//       setState(() {
//         _selectedIndex = index;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     ColorScheme colorScheme = Theme.of(context).colorScheme;
//     // return Scaffold(
//     //   body: PageStorage(
//     //     bucket: bucket,
//     //     child: _pages[_selectedIndex],
//     //   ),
//     //   bottomNavigationBar: BottomNavigationBar(
//     //     onTap: _onItemTapped,
//     //     unselectedItemColor: colorScheme.onSurface,
//     //     selectedItemColor: colorScheme.onPrimaryContainer,
//     //     type: BottomNavigationBarType.fixed,
//     //     items: <BottomNavigationBarItem>[
//     //       BottomNavigationBarItem(
//     //         icon: const Padding(
//     //           padding: EdgeInsets.all(8.0),
//     //           child: Icon(LucideIcons.house),
//     //         ),
//     //         label: 'Trang chủ',
//     //         backgroundColor: colorScheme.surfaceBright,
//     //       ),
//     //       const BottomNavigationBarItem(
//     //         icon: Padding(
//     //           padding: EdgeInsets.all(8.0),
//     //           child: Icon(LucideIcons.biceps_flexed),
//     //         ),
//     //         label: 'Bài tập',
//     //       ),
//     //       BottomNavigationBarItem(
//     //         icon: const Padding(
//     //           padding: EdgeInsets.all(8.0),
//     //           child: Icon(LucideIcons.calendar),
//     //         ),
//     //         label: 'Lộ trình',
//     //         backgroundColor: colorScheme.surfaceBright,
//     //       ),
//     //       const BottomNavigationBarItem(
//     //         icon: Padding(
//     //           padding: EdgeInsets.all(8.0),
//     //           child: Icon(LucideIcons.locate_fixed),
//     //         ),
//     //         label: 'Gym ở gần',
//     //       ),
//     //     ],
//     //   ),
//     // );
//     bool isHideBottomBar =
//         GoRouterState.of(context).uri.toString() == '/exercises/details';
//     return Scaffold(
//       body: PageStorage(
//         bucket: bucket,
//         child: SizedBox(
//           width: double.infinity,
//           height: double.infinity,
//           child: _pages[_selectedIndex],
//         ),
//       ),
//       bottomNavigationBar: !isHideBottomBar
//           ? BottomNavigationBar(
//               currentIndex: _selectedIndex,
//               backgroundColor: colorScheme.surfaceContainer,
//               onTap: (index) {
//                 setState(() {
//                   _selectedIndex = index;
//                 });
//                 // _goBranch(_selectedIndex);
//               },
//               iconSize: 30,
//               selectedItemColor: colorScheme
//                   .onPrimaryContainer, // Màu văn bản của item khi được chọn
//               unselectedItemColor:
//                   colorScheme.onSurface, // Màu của các item không được chọn
//               selectedLabelStyle: TextStyle(
//                   color: colorScheme
//                       .onPrimaryContainer), // Màu chữ của item khi chọn
//               selectedIconTheme: IconThemeData(
//                   color: colorScheme.onSecondaryContainer), // Màu icon khi chọn
//               unselectedIconTheme: IconThemeData(
//                   color: colorScheme.onSurface), // Màu icon không chọn
//               showSelectedLabels: true,
//               //showUnselectedLabels: true,

//               items: [
//                 BottomNavigationBarItem(
//                   icon: Icon(LucideIcons.house),
//                   label: 'Trang chủ',
//                   backgroundColor: _selectedIndex == 0
//                       ? colorScheme.surfaceBright
//                       : colorScheme
//                           .surfaceContainer, // Màu nền khi item được chọn
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(LucideIcons.biceps_flexed),
//                   label: 'Bài tập',
//                   backgroundColor: _selectedIndex == 1
//                       ? colorScheme.surfaceBright
//                       : colorScheme
//                           .surfaceContainer, // Màu nền khi item được chọn
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(LucideIcons.calendar),
//                   label: 'Lộ trình',
//                   backgroundColor: _selectedIndex == 2
//                       ? colorScheme.surfaceBright
//                       : colorScheme
//                           .surfaceContainer, // Màu nền khi item được chọn
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(LucideIcons.settings),
//                   label: 'Cài đặt',
//                   backgroundColor: _selectedIndex == 3
//                       ? colorScheme.surfaceBright
//                       : colorScheme
//                           .surfaceContainer, // Màu nền khi item được chọn
//                 ),
//               ],
//             )
//           : null,
//     );
//   }
// }
