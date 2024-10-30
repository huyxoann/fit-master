import 'package:fit_master/src/features/food/screens/tab_food.dart';
import 'package:fit_master/src/home_page.dart';
import 'package:flutter/material.dart';

class CompletePlanScreen extends StatefulWidget {
  const CompletePlanScreen({super.key, required this.title});

  final String title;

  @override
  State<CompletePlanScreen> createState() => _CompletePlanScreenState();
}

class _CompletePlanScreenState extends State<CompletePlanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Đã hoàn thành luyện tập',
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              height: 200,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                "assets/image/success.png",
                fit: BoxFit.contain,
                height: 100,
                width: 100,
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 30),
              child: Text(
                'Tip : Ngoài việc tập luyện bạn cần có chế độ ăn uống phù hợp để năng cao chất lượng tập luyện',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromARGB(255, 207, 80, 80),
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
                padding: const EdgeInsetsDirectional.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyHomePage(
                                    title: 'Home Screen',
                                  )),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromARGB(
                            255, 18, 129, 219), // Màu chữ trên button
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        textStyle: const TextStyle(fontSize: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8), // Thiết lập radius cố định ở đây
                        ),
                      ),
                      child: const Text("Trang chủ"),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TabFood()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromARGB(
                            255, 180, 52, 6), // Màu chữ trên button
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        textStyle: const TextStyle(fontSize: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8), // Thiết lập radius cố định ở đây
                        ),
                      ),
                      child: const Text("Món Ăn"),
                    ),
                  ],
                )),
          ],
        ),
      )),
    );
  }
}
