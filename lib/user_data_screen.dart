// file: user_data_screen.dart

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:list_view/models/user_model.dart';

class UserDataScreen extends StatefulWidget {
  final String accessToken;

  const UserDataScreen({super.key, required this.accessToken});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  User? user;
  bool isLoading = true;
  String? errorMessage;

  final Dio _dio = Dio();

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    const url = "https://dummyjson.com/auth/me";

    try {
      final response = await _dio.get(
        url,
        options: Options(
          headers: {"Authorization": "Bearer ${widget.accessToken}"},
        ),
      );

      setState(() {
        user = User.fromJson(response.data, widget.accessToken);
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = "Không thể tải dữ liệu người dùng.";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Thông tin người dùng",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage != null
          ? Center(child: Text(errorMessage!))
          : buildUserInfo(),
    );
  }

  Widget buildUserInfo() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Ảnh đại diện
            CircleAvatar(
              radius: 55,
              backgroundImage: NetworkImage(user!.image),
            ),
            const SizedBox(height: 20),

            // Tên người dùng
            Text(
              user!.fullName,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "@${user!.username}",
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // Card thông tin
            infoCard("Email", user!.email, Icons.email),
            infoCard("Số điện thoại", user!.phone, Icons.phone),
            infoCard("Giới tính", user!.gender, Icons.person),
            infoCard("Ngày sinh", user!.birthDate, Icons.calendar_month),
            infoCard("Tuổi", user!.age.toString(), Icons.numbers),
          ],
        ),
      ),
    );
  }

  // Widget tái sử dụng để tạo thẻ hiển thị thông tin
  Widget infoCard(String title, String value, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 5),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 28),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
