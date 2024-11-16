import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({
    required this.navigationShell,
    super.key,
  });
  final StatefulNavigationShell navigationShell;
  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int selectedIndex = 0;

  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    bool isHideBottomBar = GoRouterState.of(context).uri.toString() == '/exercises/details';
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: widget.navigationShell,
      ),
      bottomNavigationBar:!isHideBottomBar ? BottomNavigationBar(
        currentIndex: selectedIndex,
        backgroundColor: colorScheme.surfaceContainer,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          _goBranch(selectedIndex);
        },
        iconSize: 30,
        selectedItemColor: colorScheme.onPrimaryContainer, // Màu văn bản của item khi được chọn
        unselectedItemColor: colorScheme.onSurface, // Màu của các item không được chọn
        selectedLabelStyle: TextStyle(color: colorScheme.onPrimaryContainer), // Màu chữ của item khi chọn
        selectedIconTheme: IconThemeData(color: colorScheme.onSecondaryContainer), // Màu icon khi chọn
        unselectedIconTheme: IconThemeData(color: colorScheme.onSurface), // Màu icon không chọn
        showSelectedLabels: true,
        //showUnselectedLabels: true,
        
        items: [
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.house),
            label: 'Trang chủ',
            backgroundColor: selectedIndex == 0 ? colorScheme.surfaceBright : colorScheme.surfaceContainer, // Màu nền khi item được chọn
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.biceps_flexed),
            label: 'Bài tập',
            backgroundColor: selectedIndex == 1 ? colorScheme.surfaceBright : colorScheme.surfaceContainer, // Màu nền khi item được chọn
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.calendar),
            label: 'Lộ trình',
            backgroundColor: selectedIndex == 2 ? colorScheme.surfaceBright : colorScheme.surfaceContainer, // Màu nền khi item được chọn
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.settings),
            label: 'Cài đặt',
            backgroundColor: selectedIndex == 3 ? colorScheme.surfaceBright : colorScheme.surfaceContainer, // Màu nền khi item được chọn
          ),
        ],
      ): null,
    );
  }
}
