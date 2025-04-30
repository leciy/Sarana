import 'package:flutter/material.dart';
import 'package:sarana/Style/color.dart';

class CartFeed {
  final String username;
  final String timeAgo;
  final String category;
  final String content;
  final String avatarUrl;

  CartFeed({
    required this.username,
    required this.timeAgo,
    required this.category,
    required this.content,
    required this.avatarUrl,
  });
}

class SharingPage extends StatefulWidget {
  const SharingPage({super.key});

  @override
  State<SharingPage> createState() => _SharingPageState();
}

class _SharingPageState extends State<SharingPage> {
  int hoveredIndex = -1;
  int selectedIndex = 0;

  final List<String> filters = ["Feed", "Channel", "Friends"];

  final List<CartFeed> allCarts = [
    CartFeed(
      username: "Christy",
      timeAgo: "1 hari yang lalu",
      category: "Feed",
      content:
          "sarana.ai adalah platform yang memberdayakan ekosistem talenta Indonesia melalui kecerdasan buatan (AI).",
      avatarUrl:
          "https://static.wikia.nocookie.net/magic-academys-genius-blinker/images/5/53/Baek_profil.jpg/revision/latest?cb=20241031194442",
    ),
    CartFeed(
      username: "Christy",
      timeAgo: "1 hari yang lalu",
      category: "Feed",
      content:
          "sarana.ai adalah platform yang memberdayakan ekosistem talenta Indonesia melalui kecerdasan buatan (AI).",
      avatarUrl:
          "https://static.wikia.nocookie.net/magic-academys-genius-blinker/images/5/53/Baek_profil.jpg/revision/latest?cb=20241031194442",
    ),
    CartFeed(
      username: "Christy",
      timeAgo: "1 hari yang lalu",
      category: "Feed",
      content:
          "sarana.ai adalah platform yang memberdayakan ekosistem talenta Indonesia melalui kecerdasan buatan (AI).",
      avatarUrl:
          "https://static.wikia.nocookie.net/magic-academys-genius-blinker/images/5/53/Baek_profil.jpg/revision/latest?cb=20241031194442",
    ),
    CartFeed(
      username: "Christy",
      timeAgo: "1 hari yang lalu",
      category: "Feed",
      content:
          "sarana.ai adalah platform yang memberdayakan ekosistem talenta Indonesia melalui kecerdasan buatan (AI).",
      avatarUrl:
          "https://static.wikia.nocookie.net/magic-academys-genius-blinker/images/5/53/Baek_profil.jpg/revision/latest?cb=20241031194442",
    ),
    CartFeed(
      username: "Christy",
      timeAgo: "1 hari yang lalu",
      category: "Feed",
      content:
          "sarana.ai adalah platform yang memberdayakan ekosistem talenta Indonesia melalui kecerdasan buatan (AI).",
      avatarUrl:
          "https://static.wikia.nocookie.net/magic-academys-genius-blinker/images/5/53/Baek_profil.jpg/revision/latest?cb=20241031194442",
    ),
    CartFeed(
      username: "Andi",
      timeAgo: "3 jam yang lalu",
      category: "Channel",
      content: "#TeknologiAI",
      avatarUrl:
          "https://static.wikia.nocookie.net/magic-academys-genius-blinker/images/5/53/Baek_profil.jpg/revision/latest?cb=20241031194442",
    ),
    CartFeed(
      username: "Andi",
      timeAgo: "3 jam yang lalu",
      category: "Channel",
      content: "#TeknologiAI",
      avatarUrl:
          "https://static.wikia.nocookie.net/magic-academys-genius-blinker/images/5/53/Baek_profil.jpg/revision/latest?cb=20241031194442",
    ),
    CartFeed(
      username: "Andi",
      timeAgo: "3 jam yang lalu",
      category: "Channel",
      content: "#TeknologiAI",
      avatarUrl:
          "https://static.wikia.nocookie.net/magic-academys-genius-blinker/images/5/53/Baek_profil.jpg/revision/latest?cb=20241031194442",
    ),
    CartFeed(
      username: "Andi",
      timeAgo: "3 jam yang lalu",
      category: "Channel",
      content: "#TeknologiAI",
      avatarUrl:
          "https://static.wikia.nocookie.net/magic-academys-genius-blinker/images/5/53/Baek_profil.jpg/revision/latest?cb=20241031194442",
    ),
    CartFeed(
      username: "Andi",
      timeAgo: "3 jam yang lalu",
      category: "Channel",
      content: "#TeknologiAI",
      avatarUrl:
          "https://static.wikia.nocookie.net/magic-academys-genius-blinker/images/5/53/Baek_profil.jpg/revision/latest?cb=20241031194442",
    ),
    CartFeed(
      username: "Budi",
      timeAgo: "2 hari yang lalu",
      category: "Friends",
      content: "",
      avatarUrl:
          "https://akcdn.detik.net.id/community/media/visual/2023/01/12/antony_169.jpeg?w=700&q=90",
    ),
    CartFeed(
      username: "Budi",
      timeAgo: "2 hari yang lalu",
      category: "Friends",
      content: "",
      avatarUrl:
          "https://akcdn.detik.net.id/community/media/visual/2023/01/12/antony_169.jpeg?w=700&q=90",
    ),
    CartFeed(
      username: "Budi",
      timeAgo: "2 hari yang lalu",
      category: "Friends",
      content: "",
      avatarUrl:
          "https://akcdn.detik.net.id/community/media/visual/2023/01/12/antony_169.jpeg?w=700&q=90",
    ),
    CartFeed(
      username: "Budi",
      timeAgo: "2 hari yang lalu",
      category: "Friends",
      content: "",
      avatarUrl:
          "https://akcdn.detik.net.id/community/media/visual/2023/01/12/antony_169.jpeg?w=700&q=90",
    ),
    CartFeed(
      username: "Budi",
      timeAgo: "2 hari yang lalu",
      category: "Friends",
      content: "",
      avatarUrl:
          "https://akcdn.detik.net.id/community/media/visual/2023/01/12/antony_169.jpeg?w=700&q=90",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    String selectedFilter = filters[selectedIndex];
    List<CartFeed> filteredCarts =
        allCarts.where((cart) => cart.category == selectedFilter).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Community"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(filters.length, (index) {
              return MouseRegion(
                onEnter: (_) => setState(() => hoveredIndex = index),
                onExit: (_) => setState(() => hoveredIndex = -1),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        filters[index],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: selectedIndex == index
                              ? ColorTheme.primary
                              : Colors.black,
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.only(top: 6),
                        height: 2,
                        width: 40,
                        color: selectedIndex == index
                            ? ColorTheme.primary
                            : (hoveredIndex == index
                                ? ColorTheme.primary.withOpacity(0.5)
                                : Colors.transparent),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
          const Divider(thickness: 1),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCarts.length,
              itemBuilder: (context, index) {
                final cart = filteredCarts[index];

                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: _buildCartContent(cart, selectedFilter),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartContent(CartFeed cart, String filter) {
    if (filter == "Channel") {
      return Text(
        cart.content,
        style: const TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (filter == "Friends") {
      return Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(cart.avatarUrl),
            radius: 20,
          ),
          const SizedBox(width: 10),
          Text(
            cart.username,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(cart.avatarUrl),
                radius: 20,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cart.username,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    cart.timeAgo,
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(Icons.more_vert),
            ],
          ),
          const SizedBox(height: 12),
          // Content
          Text(
            cart.content,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 12),
          // Footer Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Row(
                children: [
                  Icon(Icons.favorite_border, size: 22),
                  SizedBox(width: 12),
                  Icon(Icons.mode_comment_outlined, size: 22),
                ],
              ),
              Icon(Icons.send, size: 22),
            ],
          ),
        ],
      );
    }
  }
}
