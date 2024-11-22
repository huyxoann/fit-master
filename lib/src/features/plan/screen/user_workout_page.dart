import 'package:fit_master/src/features/plan/model/my_plan.dart';
import 'package:fit_master/src/features/plan/model/user.dart';
import 'package:fit_master/src/features/plan/repository/my_plan.repositoryImpl.dart';
// import 'package:fit_master/src/features/plan/services/workout_service.dart';
import 'package:fit_master/src/features/plan/widget/button_widget.dart';
import 'package:flutter/material.dart';

class UserWorkoutPage extends StatefulWidget {
  const UserWorkoutPage({super.key});

  @override
  createState() => _UserWorkoutPageState();
}

class _UserWorkoutPageState extends State<UserWorkoutPage> {
  late Future<MyPlan> futureUser;

  @override
  void initState() {
    super.initState();
    // futureUser = WorkoutService().fetchUserData(); // Gọi API để lấy dữ liệu
    futureUser = MyPlanRepositoryIpml().fetchMyPlan(
      token:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsInV1aWQiOiI1NDcyOTM5YS01NzhkLTQwYTMtYTU3Yy01N2EyNDBjZWI2NzEiLCJpYXQiOjE3MzIwODUwNzUsImV4cCI6MTczMjA5NTg3NX0.3HnSj_Wgd5a6ORPwOH83pdhBAQg6Lv_0xF90TPD7Mjs",
      userId: 1,
    ); // Gọi API để lấy dữ liệu
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      // body: FutureBuilder<MyPlan>(
      //   future: futureUser,
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(child: CircularProgressIndicator());
      //     } else if (snapshot.hasError) {
      //       print(snapshot);
      //       return Center(child: Text('Error: ${snapshot.error}'));
      //     } else if (!snapshot.hasData) {
      //       return Center(child: Text('No data available'));
      //     } else {
      //       MyPlan user = snapshot.data!;

      //       return ListView(
      //         physics: BouncingScrollPhysics(),
      //         children: [
      //           ProfileWidget(
      //             imagePath:
      //                 "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png",
      //             onClicked: () {
      //               // Navigator.of(context).push(
      //               //   MaterialPageRoute(builder: (context) => EditProfilePage()),
      //               // );
      //             },
      //           ),
      //           const SizedBox(height: 24),
      //           buildName(user),
      //           const SizedBox(height: 24),
      //           Center(child: buildUpgradeButton()),
      //           const SizedBox(height: 24),
      //           NumbersWidget(
      //             weight: user.weight
      //                 .toString(), // Assuming `user.ranking` is an int
      //             height: user.height.toString(),
      //           ),
      //           const SizedBox(height: 48),
      //           buildAbout(user),
      //         ],
      //       );
      //     }
      //   },
      // ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.username,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.gender == 1 ? "Male" : "Female",
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Edit',
        onClicked: () {},
      );

  Widget buildAbout(User user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "I will become good healthy",
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
