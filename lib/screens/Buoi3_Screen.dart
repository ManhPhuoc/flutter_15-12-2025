import 'package:flutter/material.dart';

class Buoi3Screen extends StatelessWidget {
  const Buoi3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "LIST VIEW",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
      ),
      body: SafeArea(child: myBody()),
    );
  }

  Widget myBody() {
    return ListView(
      padding: const EdgeInsets.only(top: 10),
      scrollDirection: Axis.vertical,
      children: List.generate(10, (index) => itemList()),
    );
  }

  Widget itemList() {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
        color: Colors.blueGrey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lập trình di động",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Instructor: Dung Nguyen",
                    style: TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                ],
              ),
              Text("58 Students"),
            ],
          ),
          IconButton(
            onPressed: () {
              debugPrint('Nguyen Manh Phuoc');
            },
            icon: const Icon(Icons.more_horiz),
          ),
        ],
      ),
    );
  }
}
