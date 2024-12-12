import 'package:fit_master/src/component/primary_button.dart';
import 'package:fit_master/src/features/login/services/auth.service.dart';
import 'package:fit_master/src/features/login/widgets/login_bottom_sheet.dart';
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
                        label: 'Trang chủ',
                        backgroundColor: selectedIndex == 0
                            ? colorScheme.surfaceBright
                            : colorScheme
                                .surfaceContainer, // Màu nền khi item được chọn
                      ),
                      BottomNavigationBarItem(
                        icon: const Icon(LucideIcons.biceps_flexed),
                        label: 'Bài tập',
                        backgroundColor: selectedIndex == 1
                            ? colorScheme.surfaceBright
                            : colorScheme
                                .surfaceContainer, // Màu nền khi item được chọn
                      ),
                      BottomNavigationBarItem(
                        icon: const Icon(LucideIcons.calendar),
                        label: 'Lộ trình',
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
                        label: 'Gym ở gần',
                      ),
                      BottomNavigationBarItem(
                        icon: const Icon(LucideIcons.settings),
                        label: 'Cài đặt',
                        backgroundColor: selectedIndex == 3
                            ? colorScheme.surfaceBright
                            : colorScheme
                                .surfaceContainer, // Màu nền khi item được chọn
                      ),
                    ],
                  )
                : null,
          )
        : Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Center(
                    child: Container(
                      width: 164,
                      height: 164,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/logo/fitmaster_logo.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "FIT MASTER",
                        style: textTheme.headlineMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "#1 Trợ lý tập Gym cho bạn",
                        style: textTheme.headlineSmall,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      PrimaryButton(
                        label: "Bắt đầu",
                        onPressed: () =>
                            context.pushNamed('welcome-choose-input-type'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Divider(
                            color: colorScheme.outline,
                          )),
                          Text(
                            "\tĐã có tài khoản?\t",
                            style: textTheme.bodyMedium,
                          ),
                          Expanded(
                              child: Divider(
                            color: colorScheme.outline,
                          )),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return const LoginBottomSheet();
                            },
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Nhấn vào đây để đăng nhập",
                              style: textTheme.bodyMedium,
                            ),
                            Icon(
                              LucideIcons.chevron_right,
                              color: colorScheme.onSurface,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
  }
}
