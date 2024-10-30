// lib/views/gym_list_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/gym_view_model.dart';

class GymListScreen extends StatelessWidget {
  const GymListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GymViewModel(),
      child: Consumer<GymViewModel>(
        builder: (context, gymViewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Nearby Gyms'),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: gymViewModel.searchController,
                          decoration: InputDecoration(
                            hintText: 'Search for a location',
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.search),
                        onPressed: gymViewModel.searchLocation,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: gymViewModel.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : gymViewModel.errorMessage != null
                      ? Center(child: Text(gymViewModel.errorMessage!))
                      : ListView.builder(
                    itemCount: gymViewModel.gyms.length,
                    itemBuilder: (context, index) {
                      final gym = gymViewModel.gyms[index];
                      return ListTile(
                        title: Text(gym.name),
                        subtitle: Text('${gym.vicinity} - ${gym.distance} km away'),
                        onTap: () => gymViewModel.openMap(gym.latitude, gym.longitude),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
