import 'package:flutter/material.dart';
import 'package:sarana/Style/color.dart';
import 'package:sarana/widget/navbar.dart';

class ForgotPasswordPageTahap2 extends StatefulWidget {
  const ForgotPasswordPageTahap2({super.key});

  @override
  State<ForgotPasswordPageTahap2> createState() =>
      _ForgotPasswordPageTahap2State();
}

class _ForgotPasswordPageTahap2State extends State<ForgotPasswordPageTahap2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 100, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/logo_email.png",
              width: 150,
              height: 150,
            ),
            SizedBox(height: 16),
            Text(
              "Check Your",
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: ColorTheme.primary),
            ),
            Text(
              "Email In Inbox",
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: ColorTheme.primary),
            ),
            SizedBox(
              height: 15,
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(
                    fontSize: 16, color: Colors.grey), // default style
                children: [
                  TextSpan(
                    text: "We Just Send Password Recovery Instructio\n",
                  ),
                  TextSpan(
                    text: "to User ",
                  ),
                  TextSpan(
                    text: "UserClientOf@Sarana.com",
                    style: TextStyle(
                        color: ColorTheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 48,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorTheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Navbar()),
                  );
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Send",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Resend Verification (30s)",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
