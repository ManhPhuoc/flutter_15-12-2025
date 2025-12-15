// file: form_sign_in_app.dart

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// Đảm bảo import màn hình hiển thị dữ liệu
import 'user_data_screen.dart';

class FormSignInApp extends StatefulWidget {
  const FormSignInApp({super.key});

  @override
  State<FormSignInApp> createState() => _FormSignInAppState();
}

class _FormSignInAppState extends State<FormSignInApp> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Dio _dio = Dio();

  // Hàm gọi API Đăng nhập
  Future<void> _signIn() async {
    const String url = 'https://dummyjson.com/auth/login';

    if (!_formKey.currentState!.validate()) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Đang đăng nhập... Vui lòng chờ!")),
    );

    try {
      final Response response = await _dio.post(
        url,
        data: {
          'username': _usernameController.text.trim(),
          'password': _passwordController.text.trim(),
          'expiresInMins': 60,
        },
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final accessToken = data['accessToken'];

        ScaffoldMessenger.of(context).hideCurrentSnackBar();

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => UserDataScreen(accessToken: accessToken),
          ),
        );
      }
    } on DioException catch (e) {
      String errorMessage = "Đăng nhập thất bại. Vui lòng kiểm tra lại.";
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['message'] ?? errorMessage;
      } else {
        errorMessage = "Lỗi kết nối mạng hoặc server không phản hồi.";
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(errorMessage)));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Đã xảy ra lỗi không xác định: $e")),
      );
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "FORM ĐĂNG NHẬP",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
      ),
      body: myBody(),
    );
  }

  Widget myBody() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // Tên đăng nhập
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person_pin),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "Tên đăng nhập",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vui lòng nhập tên đăng nhập!';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            // Mật khẩu
            TextFormField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "Mật khẩu",
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  icon: Icon(
                    _obscurePassword ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vui lòng nhập mật khẩu!';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            // Nút Đăng nhập
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _signIn();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade900,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "ĐĂNG NHẬP",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
