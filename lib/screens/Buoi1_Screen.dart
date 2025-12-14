import 'package:flutter/material.dart';

class Buoi1Screen extends StatelessWidget {
  const Buoi1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ROW and COLUM",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: myBody(),
    );
  }

  Widget myBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Center(
          child: Text(
            "Xin chào mọi người!",
            style: TextStyle(fontSize: 30, color: Colors.red),
          ),
        ),
        Icon(Icons.heart_broken, size: 40, color: Colors.red),
        Text(
          "Lớp LTDĐ Nhóm 1",
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
