import 'package:fit_master/src/features/food/screens/list_food.dart';
import 'package:fit_master/src/features/food/screens/recommended_dishes.dart';
import 'package:flutter/material.dart';

class TabFood extends StatefulWidget {
  const TabFood({Key? key}) : super(key: key);

  @override
  State<TabFood> createState() => _TabFoodState();
}

class _TabFoodState extends State<TabFood> {
  /// List of Tab Bar Item
  List<Widget> items = [
     ListFoodScreen(),
    const RecommendedDishesScreen(),
  ];

  List<String> itemsTitle = [
    "Danh sách",
    "Đề xuất",
  ];

  int current = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    var colorTheme = Theme.of(context).colorScheme;
    return Scaffold(
      // ignore: deprecated_member_use
      backgroundColor: colorTheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          //Header bổ sung sau

          /// Tab Bar
          SizedBox(
            width: double.infinity,
            height: 80,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(itemsTitle.length, (index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            current = index;
                          });
                          pageController.animateToPage(
                            current,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.ease,
                          );
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          width: 100,
                          height: 55,
                          decoration: BoxDecoration(
                            color: current == index
                                ? colorTheme.primary
                                : colorTheme.secondary,
                            borderRadius: current == index
                                ? BorderRadius.circular(12)
                                : BorderRadius.circular(7),
                          ),
                          child: Center(
                            child: Text(
                              itemsTitle[index],
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: current == index
                                    ? colorTheme.onPrimary
                                    : colorTheme.onSecondary,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: current == index,
                        child: Container(
                          width: 5,
                          height: 5,
                          decoration: const BoxDecoration(
                            color: Colors.deepPurpleAccent,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
      
          /// MAIN BODY
          Expanded(
            child: PageView.builder(
              itemCount: items.length,
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return items[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
