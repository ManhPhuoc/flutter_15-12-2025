import 'package:flutter/material.dart';
import '../form_sign_up_app.dart';

class Buoi11Screen extends StatelessWidget {
  const Buoi11Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "FORM SIGN UP",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
      ),
      body: const FormSignUpApp(),
    );
  }
}
