import 'package:flutter/material.dart';
import 'package:sarana/Style/color.dart';
import 'package:sarana/pages/preview_materi.dart';

class TrainingPage2 extends StatefulWidget {
  const TrainingPage2({super.key});

  @override
  State<TrainingPage2> createState() => _TrainingPage2State();
}

final List<String> materiTexts = [
  'Materi 1: Pengenalan Flutter dan Dart. Ini adalah penjelasan panjang tentang konsep dasar Flutter.',
  'Materi 2: Widget Dasar. Dalam materi ini, kita membahas widget stateless dan stateful.',
  'Materi 3: Navigasi antar halaman menggunakan Navigator Adalah Salah Satu Cara Untuk Melakukan Navigasi Page Di Flutter.',
  'Materi 4: Mengapa Widget Saya Tidak Dapat Ditampilkan Karena Container saya berada pada Expanded.',
  'Materi 5: Penggunaan Scrollview Pada Aplikasi Membuat Aplikasi Dapat Melakukan Scroll Baik Secara Horizontal Maupun Vertikal',
];

String selectedCategory = 'Umum';

class Materi {
  String name;
  String description;
  String rating;
  String imagePath;

  Materi({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.rating,
  });

  static final List<Materi> detailMateri = [
    Materi(
      name: "Apa itu Flutter? Platform Baru\nDalam Pengembangan\nMobile App",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus non neque a elit pretium molestie vitae id justo. Aliquam porta risus quis nunc commodo maximus. Mauris eu diam vel lorem dictum maximus ut et quam. Ut ut metus posuere, pretium libero quis, congue purus. Aenean in nisl tincidunt, malesuada enim et, pulvinar felis. Fusce fermentum augue non fringilla ullamcorper. Integer cursus augue nibh, non condimentum dolor luctus non. Cras ex sem, gravida ut consequat quis, aliquet gravida velit. Ut eu cursus odio.Suspendisse id nulla et massa tristique sodales eu a velit. Maecenas quam dui, pellentesque sit amet consectetur eget, convallis et tortor. Vivamus est justo, rutrum ut malesuada quis, commodo eget risus. Maecenas varius varius orci eu ullamcorper. Sed nec blandit lorem, non tincidunt felis. Donec ultrices, orci ut lacinia auctor, leo magna vestibulum metus, eget porttitor mi massa rutrum lectus. Nullam egestas vulputate ante eu vulputate. Nunc sollicitudin eu massa eget elementum. Maecenas turpis metus, elementum vel accumsan sit amet, viverra hendrerit nisl.Quisque non dignissim lacus, elementum ultrices purus. Quisque condimentum nulla in hendrerit facilisis. Phasellus eget pulvinar diam, in iaculis felis. Sed non lobortis felis. Integer consectetur ullamcorper metus, pellentesque porttitor arcu dapibus in. Nunc vestibulum sapien ipsum, in congue erat pretium vel. Sed nec tempor risus. Cras a eros consequat, blandit tortor sed, venenatis nisi. Praesent nisl ligula, consectetur nec feugiat ac, mattis vitae eros. Phasellus laoreet arcu in felis eleifend maximus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer sit amet felis ut turpis maximus commodo. Mauris nec tincidunt turpis. Donec at nisl eget tellus efficitur dapibus sit amet et nulla. Maecenas sit amet fermentum tellus, porta pretium felis.",
      rating: "4.7",
      imagePath: "assets/download.jpg",
    ),
  ];
}

class _TrainingPage2State extends State<TrainingPage2> {
  @override
  Widget build(BuildContext context) {
    final materi = Materi.detailMateri[0];

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
                0.09
              ]),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  bottom: 10,
                ),
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 100.0),
                        child: Text(
                          "Materi",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              Divider(height: 1, thickness: 1),
              Stack(
                children: [
                  Image.asset(
                    materi.imagePath,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 40,
                    left: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Judul Materi
                        Text(
                          materi.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                blurRadius: 4,
                                color: Colors.black.withOpacity(0.6),
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                        ),
                        // Memberikan jarak antara judul dan rating
                        SizedBox(height: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      materi.rating,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          Shadow(
                                            blurRadius: 4,
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            offset: Offset(2, 2),
                                          ),
                                        ],
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      "47k Reviews",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                                SizedBox(width: 20),
                                Container(
                                    height: 24, width: 1, color: Colors.white),
                                SizedBox(width: 20),
                                Column(
                                  children: [
                                    Text(
                                      "10M+",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          Shadow(
                                            blurRadius: 4,
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            offset: Offset(2, 2),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "Participants",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                                SizedBox(width: 20),
                                Container(
                                    height: 24, width: 1, color: Colors.white),
                                SizedBox(width: 20),
                                Column(
                                  children: [
                                    Text(
                                      "12",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          Shadow(
                                            blurRadius: 4,
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            offset: Offset(2, 2),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "Sections",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            GestureDetector(
                              child: Container(
                                height: 48,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: ColorTheme.primary,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Enroll",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 8),
                                      Icon(Icons.menu_book,
                                          color: Colors.white),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PreviewMateri()));
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 4, left: 20, right: 20),
                    child: Text(
                      "Course Section",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: List.generate(materiTexts.length, (index) {
                        return Container(
                          width: 333,
                          margin: const EdgeInsets.only(right: 16),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            materiTexts[index],
                            style: TextStyle(fontSize: 14),
                          ),
                        );
                      }),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                    child: Text(
                      "About This Course",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                    child: Text(materi.description),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
