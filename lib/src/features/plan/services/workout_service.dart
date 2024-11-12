import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/user.dart';

class WorkoutService {
  final String apiUrl = 'http://192.168.0.124:3000/user'; // Thay URL của API

  Future<User> fetchUserData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl)); // Lấy dữ liệu user theo ID (thay đổi URL theo cần thiết)

      if (response.statusCode == 200) {

        return User.fromJson(json.decode(response.body));

      } else {
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
