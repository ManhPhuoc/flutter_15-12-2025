import 'package:flutter/material.dart';
import 'screens/buoi1_screen.dart';
import 'screens/buoi2_screen.dart';
import 'screens/buoi3_screen.dart';
import 'screens/buoi4_screen.dart';
import 'screens/buoi5_screen.dart';
import 'screens/buoi6_Screen.dart';
import 'screens/Buoi7_Screen.dart';
import 'screens/Buoi8_Screen.dart';
import 'screens/Buoi9_Screen.dart';
import 'screens/buoi10_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Màn hình đang hiển thị
  Widget _currentScreen = const Buoi1Screen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "DANH SÁCH PROJECT",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      // 👉 DRAWER (CỘT TRÁI)
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "LIST VIEW",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),

            // 👉 BUỔI 1
            ListTile(
              leading: const Icon(Icons.looks_one),
              title: const Text("Buổi 1"),
              onTap: () {
                setState(() {
                  _currentScreen = const Buoi1Screen();
                });
                Navigator.pop(context); // đóng drawer
              },
            ),

            ListTile(
              leading: const Icon(Icons.looks_two),
              title: const Text("Buổi 2"),
              onTap: () {
                setState(() {
                  _currentScreen = const Buoi2Screen();
                });
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.looks_3),
              title: const Text("Buổi 3"),
              onTap: () {
                setState(() {
                  _currentScreen = const Buoi3Screen();
                });
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.looks_4),
              title: const Text("Buổi 4"),
              onTap: () {
                setState(() {
                  _currentScreen = const Buoi4Screen();
                });
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.looks_5),
              title: const Text("Buổi 5"),
              onTap: () {
                setState(() {
                  _currentScreen = const Buoi5Screen();
                });
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.looks_6),
              title: const Text("Buổi 6"),
              onTap: () {
                setState(() {
                  _currentScreen = const Buoi6Screen();
                });
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.api),
              title: const Text("Buổi 7"),
              subtitle: const Text("Đăng nhập & API"),
              onTap: () {
                setState(() {
                  _currentScreen = const Buoi7Screen();
                });
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Container(
                width: 28,
                height: 28,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.shade700,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  "8",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: const Text("Buổi 8"),
              subtitle: const Text("Call API Product"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const Buoi8Screen()),
                );
              },
            ),

            ListTile(
              leading: Container(
                width: 28,
                height: 28,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.shade700,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  "9",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: const Text("Buổi 9"),
              subtitle: const Text("Shoes House – GridView API"),
              onTap: () {
                setState(() {
                  _currentScreen = const Buoi9Screen();
                });
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Container(
                width: 28,
                height: 28,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.shade700,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  "10",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: const Text("Buổi 10"),
              subtitle: const Text("News API"),
              onTap: () {
                setState(() {
                  _currentScreen = const Buoi10Screen();
                });
                Navigator.pop(context);
              },
            ),

            // (sau này thêm Buổi 2, API...)
          ],
        ),
      ),

      // 👉 NỘI DUNG BÊN PHẢI
      body: _currentScreen,
    );
  }
}
