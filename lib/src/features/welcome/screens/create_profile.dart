import 'package:fit_master/src/config/logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late Future<Map<dynamic, dynamic>> _data;

  Future<Map<dynamic, dynamic>> _loadData() async {
    var box = await Hive.openBox('userDataBox');
    return box.toMap();
  }

  @override
  void initState() {
    super.initState();
    _data = _loadData();
    _data.then((data) {
      data.forEach((key, value) {
        logger.i('$key: $value');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 20),
            const Text(
              'Vui lòng đợi để hệ thống khởi tạo lộ trình riêng cho bạn',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            FilledButton(
                onPressed: () => context.pushNamed('workout-recommendation'),
                child: const Text('Xem lộ trình'))
          ],
        ),
      ),
    );
  }
}
