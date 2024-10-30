// import 'package:geolocator/geolocator.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
//
// Future<Position?> _getCurrentLocation() async {
//   bool serviceEnabled;
//   LocationPermission permission;
//
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     return null;
//   }
//
//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
//       return null;
//     }
//   }
//
//   if (permission == LocationPermission.deniedForever) {
//     return null;
//   }
//
//   return await Geolocator.getCurrentPosition();
// }
//
// Future<List<dynamic>> getNearbyGyms(double latitude, double longitude) async {
//   final String apiKey = 'AlzaSykrTZNB6QxDEY7NmEtJhtp6WcqLFEMDuIK';
//   final String url =
//       'https://maps.gomaps.pro/maps/api/place/nearbysearch/json?location=$latitude,$longitude&radius=4000&type=gym&key=$apiKey';
//
//   final response = await http.get(Uri.parse(url));
//
//   if (response.statusCode == 200) {
//     final data = json.decode(response.body);
//     return data['results'];
//   } else {
//     throw Exception('Failed to load gyms');
//   }
// }
//
// Future<Map<String, dynamic>> getLocationFromAddress(String address) async {
//   final String apiKey = 'AlzaSykrTZNB6QxDEY7NmEtJhtp6WcqLFEMDuIK';
//   final String url =
//       'https://maps.gomaps.pro/maps/api/geocode/json?address=$address&key=$apiKey';
//
//   final response = await http.get(Uri.parse(url));
//
//   if (response.statusCode == 200) {
//     final data = json.decode(response.body);
//     if (data['results'].isNotEmpty) {
//       return data['results'][0]['geometry']['location'];
//     } else {
//       throw Exception('No location found');
//     }
//   } else {
//     throw Exception('Failed to load location');
//   }
// }
//
// class GymListScreen extends StatefulWidget {
//   const GymListScreen({Key? key}) : super(key: key);
//
//   @override
//   _GymListScreenState createState() => _GymListScreenState();
// }
//
// class _GymListScreenState extends State<GymListScreen> {
//   List<Map<String, dynamic>> _gyms = [];
//   final TextEditingController _searchController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     _loadGymsByCurrentLocationOrSearch();
//   }
//
//   Future<void> _loadGymsByCurrentLocationOrSearch() async {
//     Position? position = await _getCurrentLocation();
//     if (position != null) {
//       _loadGyms(position.latitude, position.longitude);
//     } else {
//       // If permissions are denied, fallback to search
//       await _searchLocation();
//     }
//   }
//
//   Future<void> _loadGyms(double latitude, double longitude) async {
//     try {
//       List<dynamic> gyms = await getNearbyGyms(latitude, longitude);
//       setState(() {
//         _gyms = gyms.map((gym) {
//           final double gymLat = gym['geometry']['location']['lat'];
//           final double gymLng = gym['geometry']['location']['lng'];
//           final double distanceInMeters = Geolocator.distanceBetween(
//             latitude,
//             longitude,
//             gymLat,
//             gymLng,
//           );
//           return {
//             'name': gym['name'],
//             'vicinity': gym['vicinity'],
//             'lat': gymLat,
//             'lng': gymLng,
//             'distance': (distanceInMeters / 1000).toStringAsFixed(2), // Convert to kilometers
//           };
//         }).toList();
//       });
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
//
//   Future<void> _searchLocation() async {
//     if (_searchController.text.isEmpty) {
//       Position? position = await _getCurrentLocation();
//       if (position != null) {
//         _loadGyms(position.latitude, position.longitude);
//       } else {
//         print("Location services or permissions are unavailable.");
//       }
//     } else {
//       try {
//         final location = await getLocationFromAddress(_searchController.text);
//         _loadGyms(location['lat'], location['lng']);
//       } catch (e) {
//         print('Error: $e');
//       }
//     }
//   }
//
//   Future<void> _openMap(double latitude, double longitude) async {
//     final googleMapsUrl = 'https://www.google.com/maps/dir/?api=1&destination=$latitude,$longitude&travelmode=driving';
//     if (await canLaunch(googleMapsUrl)) {
//       await launch(googleMapsUrl);
//     } else {
//       throw 'Could not open the map.';
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Nearby Gyms'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _searchController,
//                     decoration: InputDecoration(
//                       hintText: 'Search for a location',
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.search),
//                   onPressed: _searchLocation,
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: _gyms.isEmpty
//                 ? Center(child: CircularProgressIndicator())
//                 : ListView.builder(
//               itemCount: _gyms.length,
//               itemBuilder: (context, index) {
//                 final gym = _gyms[index];
//                 return ListTile(
//                   title: Text(gym['name']),
//                   subtitle: Text('${gym['vicinity']} - ${gym['distance']} km away'),
//                   onTap: () => _openMap(gym['lat'], gym['lng']),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
