import 'package:flutter/material.dart';

import 'package:sarana/pages/change_password_page.dart';
import 'package:sarana/pages/edit_profile_page.dart';
import 'package:sarana/pages/login_page.dart';
import 'package:sarana/pages/privacy_policy.dart';
import 'package:sarana/pages/terms_condition_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Settings"),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditProfilePage()),
                );
              },
              child: const Text(
                "Edit Profile",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangePasswordPage(),
                  ),
                );
              },
              child: const Text(
                "Change Password",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.remove('token'); // Hapus token
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false,
                );
              },
              child: const Text(
                "Logout",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TermsConditionPage(),
                  ),
                );
              },
              child: const Text(
                "Terms & Condition",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PrivacyPolicy(),
                  ),
                );
              },
              child: const Text(
                "Privacy Policy",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            ],
          
        ),
      ),
    );
  }
}
