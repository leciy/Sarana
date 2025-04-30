import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sarana/pages/daily_checkin_page.dart';
import 'package:sarana/pages/leaderboard_page.dart';
import 'package:sarana/pages/rewards_page.dart';
import 'package:sarana/pages/training_page.dart';
import 'package:sarana/pages/training_page_2.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  final List<String> bannerImages = [
    'assets/banner.png',
    'assets/banner.png',
    'assets/banner.png'
  ];

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
            ]),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 27,
                      backgroundImage: AssetImage('assets/google_24.png'),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Hi, Chesa 👋',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Logo SARANA
                CarouselSlider(
                  options: CarouselOptions(
                      height: 155,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 1),
                  items: bannerImages.map((imagePath) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 5),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              imagePath,
                              width: double.infinity,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildMenuItem(Icons.school, 'Training', () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TrainingPage()));
                    }),
                    _buildMenuItem(Icons.card_giftcard, 'Rewards', () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RewardsScreen()));
                    }),
                    _buildMenuItem(Icons.emoji_events, 'Leaderboard', () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LeaderboardPage()));
                    }),
                    _buildMenuItem(Icons.check_circle, 'Check-in', () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DailyCheckinPage()));
                    }),
                  ],
                ),

                const SizedBox(height: 24),

                const Text(
                  'Recommendation',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
                ),
                const SizedBox(height: 12),

                // Course Card list
                GridView.builder(
                  shrinkWrap: true,
                  physics:
                      NeverScrollableScrollPhysics(), // Biar gak konflik scroll-nya
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 16,
                    childAspectRatio: 3 / 4,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return _buildCourseCard();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget _buildMenuItem(IconData icon, String label, VoidCallback onTap) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
            ),
            child: Icon(icon, color: Colors.blue),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildCourseCard() {
    return GestureDetector(
      child: Container(
        width: 1500,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.only(left: 8.0),
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/logo_email.png",
              width: double.infinity,
              height: 60,
              fit: BoxFit.contain,
            ),
            Text(
              "Lorem Ipsum Heritage Of Alchemy",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '11 Bab',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.grey[700]),
                      ),
                      Text(
                        "1 Hari Yang Lalu",
                        style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
                      Text(
                        "5.0",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TrainingPage2()));
      },
    );
  }
}
