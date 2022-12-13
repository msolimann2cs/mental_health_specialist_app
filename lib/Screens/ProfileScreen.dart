import 'package:flutter/material.dart';
import 'package:mental_health/Components/BottomNavBar.dart';
import 'package:mental_health/Components/ButtonCard.dart';
import 'package:mental_health/Screens/LoginScreen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static String id = "profile_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonCard(
                  buttonText: "Logout",
                  func: () {
                    Navigator.popUntil(
                        context, ModalRoute.withName(LoginScreen.id));
                  }),
              BottomNavBar(),
            ],
          ),
        ),
      ),
    );
  }
}
