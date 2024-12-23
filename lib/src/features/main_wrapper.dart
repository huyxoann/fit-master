import 'package:fit_master/src/features/login/screens/login_screen.dart';
import 'package:fit_master/src/features/login/services/auth.service.dart';
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
  // Key _pageKey = ValueKey(0);
  late bool isLogined;

  @override
  void initState() {
    super.initState();
    isLogined = false;
    AuthService().checkLoginState().then((value) {
      setState(() {
        isLogined = value;
      });
    });
  }

  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    bool isHideBottomBar =
        GoRouterState.of(context).uri.toString() == '/exercises/details';

    TextTheme textTheme = Theme.of(context).textTheme;

    return isLogined
        ? Scaffold(
            body: SizedBox(
              width: double.infinity,
              height: double.infinity,
              // key: _pageKey,
              child: widget.navigationShell,
            ),
            bottomNavigationBar: !isHideBottomBar
                ? BottomNavigationBar(
                    currentIndex: selectedIndex,
                    backgroundColor: colorScheme.surfaceContainer,
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                        // _pageKey = ValueKey(index);
                      });
                      _goBranch(selectedIndex);
                    },
                    iconSize: 30,
                    selectedItemColor: colorScheme
                        .onPrimaryContainer, // Màu văn bản của item khi được chọn
                    unselectedItemColor: colorScheme
                        .onSurface, // Màu của các item không được chọn
                    selectedLabelStyle: TextStyle(
                        color: colorScheme
                            .onPrimaryContainer), // Màu chữ của item khi chọn
                    selectedIconTheme: IconThemeData(
                        color: colorScheme
                            .onSecondaryContainer), // Màu icon khi chọn
                    unselectedIconTheme: IconThemeData(
                        color: colorScheme.onSurface), // Màu icon không chọn
                    showSelectedLabels: true,
                    //showUnselectedLabels: true,

                    items: [
                      BottomNavigationBarItem(
                        icon: const Icon(LucideIcons.house),
                        label: 'Home',
                        backgroundColor: selectedIndex == 0
                            ? colorScheme.surfaceBright
                            : colorScheme
                                .surfaceContainer, // Màu nền khi item được chọn
                      ),
                      BottomNavigationBarItem(
                        icon: const Icon(LucideIcons.biceps_flexed),
                        label: 'Exercises',
                        backgroundColor: selectedIndex == 1
                            ? colorScheme.surfaceBright
                            : colorScheme
                                .surfaceContainer, // Màu nền khi item được chọn
                      ),
                      BottomNavigationBarItem(
                        icon: const Icon(LucideIcons.calendar),
                        label: 'Routine',
                        backgroundColor: selectedIndex == 2
                            ? colorScheme.surfaceBright
                            : colorScheme
                                .surfaceContainer, // Màu nền khi item được chọn
                      ),
                      const BottomNavigationBarItem(
                        icon: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(LucideIcons.map_pin),
                        ),
                        label: 'Nearby Gyms',
                      ),
                      BottomNavigationBarItem(
                        icon: const Icon(LucideIcons.menu),
                        label: 'Menu',
                        backgroundColor: selectedIndex == 3
                            ? colorScheme.surfaceBright
                            : colorScheme
                                .surfaceContainer, // Màu nền khi item được chọn
                      ),
                    ],
                  )
                : null,
          )
        : const LoginScreen();
  }
}
