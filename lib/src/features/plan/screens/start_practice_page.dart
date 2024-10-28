import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class StartPracticeScreen extends StatefulWidget {
  const StartPracticeScreen({super.key, required this.title});

  final String title;

  @override
  State<StartPracticeScreen> createState() => _PlanTodayScreenState();
}

class _PlanTodayScreenState extends State<StartPracticeScreen> {
 

  @override
  Widget build(BuildContext context) {
   
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: const SafeArea(
        child: Row(
          children: [
            Text("data")
          ],
        )),
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
