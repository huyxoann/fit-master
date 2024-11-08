import 'package:fit_master/src/core/models/enum.dart';
import 'package:flutter/material.dart';

class GymLocationCard extends StatelessWidget {
  final GymLocation gymLocation;

  const GymLocationCard({
    super.key,
    required this.gymLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(gymLocation == GymLocation.gym
              ? 'assets/images/background/gym.jpg'
              : 'assets/images/background/home.jpg'),
          Text(
            gymLocation == GymLocation.gym ? "Phòng tập" : "Nhà",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
