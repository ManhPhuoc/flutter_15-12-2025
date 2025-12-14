import 'package:flutter/material.dart';

class Buoi4Screen extends StatelessWidget {
  const Buoi4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final hotels = [
      {
        'name': 'aNhill Boutique',
        'rating': 9.5,
        'reviews': 95,
        'reviewText': 'Xuất sắc',
        'location': 'Huế · Cách bạn 0,6km',
        'price': 109,
        'image': 'https://picsum.photos/200/300?1',
        'type': '1 suite riêng tư: 1 giường',
        'breakfast': true,
        'description': null,
        'stars': 5,
      },
      {
        'name': 'An Nam Hue Boutique',
        'rating': 9.2,
        'reviews': 34,
        'reviewText': 'Tuyệt hảo',
        'location': 'Cư Chinh · Cách bạn 0,9km',
        'price': 20,
        'image': 'https://picsum.photos/200/300?2',
        'type': '1 phòng khách sạn: 1 giường',
        'breakfast': true,
        'description': null,
        'stars': 5,
      },
      {
        'name': 'Huế Jade Hill Villa',
        'rating': 8.0,
        'reviews': 1,
        'reviewText': 'Rất tốt',
        'location': 'Cư Chinh · Cách bạn 1,3km',
        'price': 285,
        'image': 'https://picsum.photos/200/300?3',
        'type': '1 biệt thự nguyên căn – 4 giường · 3 phòng ngủ · 3 phòng tắm',
        'breakfast': false,
        'description': 'Được quản lý bởi một host cá nhân',
        'notes': 'Chỉ còn 1 căn với giá này',
        'noPayment': true,
        'stars': 5,
      },
      {
        'name': 'Êm Villa',
        'rating': null,
        'reviews': null,
        'reviewText': null,
        'location': 'Huế',
        'price': null,
        'image': 'https://picsum.photos/200/300?4',
        'type': 'Villa nghỉ dưỡng',
        'breakfast': true,
        'description': 'Được quản lý bởi host cá nhân',
        'stars': 5,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "HOTEL UI",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: Colors.blue.shade900,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade100,
      body: Stack(
        children: [
          Column(
            children: [
              Container(height: 60, color: Colors.blue.shade900),
              Expanded(child: Container(color: Colors.grey.shade100)),
            ],
          ),
          Column(
            children: [
              _searchBox(),
              _filterBar(),
              const Divider(height: 1),
              const Padding(
                padding: EdgeInsets.all(12),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Danh sách chỗ nghỉ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: hotels.length,
                  itemBuilder: (context, index) {
                    return HotelCard(hotel: hotels[index]);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _searchBox() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.amber, width: 3),
      ),
      child: const Row(
        children: [
          Icon(Icons.search),
          SizedBox(width: 8),
          Text("Xung quanh vị trí hiện tại"),
        ],
      ),
    );
  }

  Widget _filterBar() {
    return Container(
      height: 48,
      color: Colors.white,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconText(icon: Icons.sort, text: "Sắp xếp"),
          IconText(icon: Icons.filter_list, text: "Lọc"),
          IconText(icon: Icons.map, text: "Bản đồ"),
        ],
      ),
    );
  }
}

/* ------------------ WIDGET PHỤ ------------------ */

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconText({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Icon(icon, size: 18), const SizedBox(width: 4), Text(text)],
    );
  }
}

class HotelCard extends StatelessWidget {
  final Map<String, dynamic> hotel;

  const HotelCard({super.key, required this.hotel});

  String _stars(int count) => '⭐' * count;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(12),
            ),
            child: Image.network(
              hotel['image'],
              width: 120,
              height: 160,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hotel['name'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  if (hotel['stars'] != null)
                    Text(
                      _stars(hotel['stars']),
                      style: const TextStyle(fontSize: 12),
                    ),
                  if (hotel['rating'] != null)
                    Text(
                      '${hotel['rating']} · ${hotel['reviewText']}',
                      style: const TextStyle(fontSize: 12),
                    ),
                  const SizedBox(height: 6),
                  Text(
                    hotel['location'],
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 6),
                  if (hotel['price'] != null)
                    Text(
                      'US\$${hotel['price']}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
