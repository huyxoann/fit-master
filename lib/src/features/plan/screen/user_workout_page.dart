import 'package:fit_master/src/features/plan/model/user.dart';
import 'package:fit_master/src/features/plan/services/workout_service.dart';
import 'package:fit_master/src/features/plan/widget/button_widget.dart';
import 'package:fit_master/src/features/plan/widget/numbers_widget.dart';
import 'package:fit_master/src/features/plan/widget/profile_widget.dart';
import 'package:flutter/material.dart';


class UserWorkoutPage extends StatefulWidget {
  const UserWorkoutPage({super.key});

  @override
  createState() => _UserWorkoutPageState();
}

class _UserWorkoutPageState extends State<UserWorkoutPage> {
  late Future<User> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = WorkoutService().fetchUserData(); // Gọi API để lấy dữ liệu
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: FutureBuilder<User>(
        future: futureUser,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print(snapshot);
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data available'));
          } else {
            User user = snapshot.data!;

            return ListView(
              physics: BouncingScrollPhysics(),
              children: [
                ProfileWidget(
                  imagePath: "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png",
                  onClicked: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(builder: (context) => EditProfilePage()),
                    // );
                  },
                ),
                const SizedBox(height: 24),
                buildName(user),
                const SizedBox(height: 24),
                Center(child: buildUpgradeButton()),
                const SizedBox(height: 24),
                NumbersWidget(
                  weight: user.weight.toString(), // Assuming `user.ranking` is an int
                  height: user.height.toString(),

                ),
                const SizedBox(height: 48),
                buildAbout(user),
              ],
            );
          }
        },
      ),
    );
  }

  Widget buildName(User user) => Column(
    children: [
      Text(
        user.username,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      const SizedBox(height: 4),
      Text(
        user.gender == 1 ? "Male" : "Female",
        style: TextStyle(color: Colors.grey),
      ),
    ],
  );

  Widget buildUpgradeButton() => ButtonWidget(
    text: 'Edit',
    onClicked: () {},
  );

  Widget buildAbout(User user) => Container(
    padding: EdgeInsets.symmetric(horizontal: 48),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text(
          "I will become good healthy",
          style: TextStyle(fontSize: 16, height: 1.4),
        ),
      ],
    ),
  );

}
