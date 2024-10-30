// lib/repositories/gym_repository.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import '../models/gym.dart';

class GymRepository {
  final String apiKey = 'AlzaSykrTZNB6QxDEY7NmEtJhtp6WcqLFEMDuIK';

  Future<List<Gym>> getNearbyGyms(double latitude, double longitude) async {
    final String url =
        'https://maps.gomaps.pro/maps/api/place/nearbysearch/json?location=$latitude,$longitude&radius=4000&type=gym&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['results'] as List).map((gym) {
        final double gymLat = gym['geometry']['location']['lat'];
        final double gymLng = gym['geometry']['location']['lng'];
        final double distanceInMeters = Geolocator.distanceBetween(
          latitude,
          longitude,
          gymLat,
          gymLng,
        );
        return Gym(
          name: gym['name'],
          vicinity: gym['vicinity'],
          latitude: gymLat,
          longitude: gymLng,
          distance: (distanceInMeters / 1000).toStringAsFixed(2),
        );
      }).toList();
    } else {
      throw Exception('Failed to load gyms');
    }
  }

  Future<Map<String, dynamic>> getLocationFromAddress(String address) async {
    final String url =
        'https://maps.gomaps.pro/maps/api/geocode/json?address=$address&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['results'].isNotEmpty) {
        return data['results'][0]['geometry']['location'];
      } else {
        throw Exception('No location found');
      }
    } else {
      throw Exception('Failed to load location');
    }
  }
}
