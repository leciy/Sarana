import 'package:flutter/material.dart';
import 'package:sarana/pages/edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color(0xFF34C1F0),
            Color(0xFFEEFBFF),
          ],
              stops: [
            0.0,
            0.3
          ])),
      child: Column(
        children: [
          Text(
            "Profile",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat'),
          ),
          Center(
            child: Container(
              padding: EdgeInsetsDirectional.only(top: 135),
              child: CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 60,
              ),
            ),
          )
        ],
      ),
    ));
  }
}
