import 'package:flutter/material.dart';
import 'package:sarana/pages/history_reedem.dart';

class RewardPage extends StatefulWidget {
  const RewardPage({super.key});

  @override
  State<RewardPage> createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Reward"),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HistoryReedem(),
                  ),
                );
              },
              child: const Text(
                "History",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  decoration: TextDecoration.underline,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
class RewardItem {
  final String name;
  final String amount;
  final int pointsRequired;
  final String imageAsset;
  final Color color;

  RewardItem({
    required this.name,
    required this.amount,
    required this.pointsRequired,
    required this.imageAsset,
    required this.color,
  });
}