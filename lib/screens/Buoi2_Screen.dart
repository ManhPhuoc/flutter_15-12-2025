import 'package:flutter/material.dart';

class Buoi2Screen extends StatelessWidget {
  const Buoi2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "IMAGE",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue.shade900,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: myBody(),
    );
  }

  Widget myBody() {
    return Column(children: [block1(), block2(), block4()]);
  }

  Widget block1() {
    const src =
        "https://tse3.mm.bing.net/th/id/OIP.BW8UFTKv-WGyxX2lzpUpKwHaE8?pid=Api&P=0&h=220";
    return Image.network(src);
  }

  Widget block2() {
    const title = "Sahara";
    const subtitle = "Miền Bắc Châu Phi";
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(subtitle, style: TextStyle(color: Colors.grey)),
            ],
          ),
          Row(
            children: const [
              Icon(Icons.star, color: Colors.red),
              Text("41"),
            ],
          ),
        ],
      ),
    );
  }

  Widget block4() {
    const content =
        "Được bao bọc bởi biển Đại Tây Dương ở phía Tây, dãy núi Atlas và Địa Trung Hải ở phía Bắc, Biển Đỏ (Hồng Hải) và Ai Cập ở phía Đông; Sudan và thung lũng sông Niger ở phía Nam. Điểm cao nhất trong sa mạc là đỉnh núi Emi Koussi với độ cao 3415 m so với mực nước biển, thuộc dãy núi Tibesti phía Bắc nước Tchad.";
    return const Padding(padding: EdgeInsets.all(20), child: Text(content));
  }
}
