import 'package:flutter/material.dart';
import 'package:sarana/pages/training_page_2.dart';

class TrainingPage extends StatefulWidget {
  const TrainingPage({super.key});

  @override
  State<TrainingPage> createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  final List<String> categories = [
    'Umum',
    'Aprentice',
    'Employee',
    'Senior',
    'Administrator'
  ];

  String selectedCategory = 'Umum';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
              "Training",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories.map((category) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: CategoryItem(
                        label: category,
                        isSelected: selectedCategory == category,
                        onTap: () {
                          setState(() {
                            selectedCategory = category;
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Grid Card Materi
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
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

class CategoryItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryItem({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blueAccent : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.blueAccent : Colors.grey.shade400,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 4,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
