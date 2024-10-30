// lib/view_models/gym_view_model.dart
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../models/gym.dart';
import '../repositories/gym_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class GymViewModel extends ChangeNotifier {
  final GymRepository _gymRepository = GymRepository();
  List<Gym> gyms = [];
  TextEditingController searchController = TextEditingController();
  bool isLoading = true;
  String? errorMessage;

  GymViewModel() {
    _loadGymsByCurrentLocationOrSearch();
  }

  Future<void> _loadGymsByCurrentLocationOrSearch() async {
    Position? position = await _getCurrentLocation();
    if (position != null) {
      await _loadGyms(position.latitude, position.longitude);
    } else {
      errorMessage = "Location services or permissions are unavailable.";
      notifyListeners();
    }
  }

  Future<Position?> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return null;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return null;
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> _loadGyms(double latitude, double longitude) async {
    isLoading = true;
    notifyListeners();
    try {
      gyms = await _gymRepository.getNearbyGyms(latitude, longitude);
      errorMessage = null; // Clear previous error
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> searchLocation() async {
    if (searchController.text.isEmpty) {
      Position? position = await _getCurrentLocation();
      if (position != null) {
        await _loadGyms(position.latitude, position.longitude);
      }
    } else {
      try {
        final location = await _gymRepository.getLocationFromAddress(searchController.text);
        await _loadGyms(location['lat'], location['lng']);
      } catch (e) {
        errorMessage = e.toString();
        notifyListeners();
      }
    }
  }

  Future<void> openMap(double latitude, double longitude) async {
    final googleMapsUrl =
        'https://www.google.com/maps/dir/?api=1&destination=$latitude,$longitude&travelmode=driving';
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}
