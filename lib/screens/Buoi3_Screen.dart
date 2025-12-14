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
        backgroundColor: Colors.brown,
      ),
      body: SafeArea(child: myBody()),
    );
  }

  Widget myBody() {
    return ListView(
      scrollDirection: Axis.vertical,
      children: List.generate(10, (index) => itemList()),
    );
  }

  Widget itemList() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
        color: Colors.amberAccent,
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
                  Text("Lập trình di động"),
                  Text("Instructor : Dung Nguyen"),
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
